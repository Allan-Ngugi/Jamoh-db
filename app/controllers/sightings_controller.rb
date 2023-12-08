class SightingsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # added rescue_from
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
  @sightings = Sightings.all
  end

  def show

  end

  def create
      @sightings = Sightings.create!(animal_params)
      render json: sightings, status: :created
  end

  def update
      @sighting = find_sighting
      @sighting.update!(sighting_params)
      render json: sighting
  end

  def destroy
      @sighting.destroy
      redirect_to sighting_url, notice: 'Sighting was successfully destroyed.'
  end
    
  private
    
  def set_animal
    @sighting = Sighting.find(params[:id])
  end
    
  def sighting_params
      params.require(:sighting).permit(:name )
  end

  def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
