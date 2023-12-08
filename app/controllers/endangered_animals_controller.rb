class EndangeredAnimalsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
      # added rescue_from
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
    @endangered_animals = EndangeredAnimal.all
    end

    def show

    end

    def create
        @endangered_animal = Endangered_animal.create!(animal_params)
        render json: endangered_animal, status: :created
    end

    def update
        @endangered_animal = find_animal
        @endangered_animal.update!(endangered_animal_params)
        render json: endangered_animal
    end

    def destroy
        @endangered_animal.destroy
        redirect_to endangered_animals_url, notice: 'Endangered Animal was successfully destroyed.'
    end
      
    private
      
    def set_animal
      @endangered_animal = EndangeredAnimal.find(params[:id])
    end
      
    def animal_params
        params.require(:endangered_animal).permit(:name, :sighting)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
      end

end
