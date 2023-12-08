class AnimalsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
      # added rescue_from
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def index
     @animals = Animal.all
        end
          
        def show
        end
          
        def new
            @animal = Animal.new
        end
          
        def edit
        end
        
        def create
            @animal = Animal.create!(animal_params)
            render json: animal, status: :created
        end

        def update
            @animal = find_animal
            @animal.update!(animal_params)
            render json: animal 
        end
          
        def destroy
            @animal.destroy
            redirect_to animals_url, notice: 'Animal was successfully destroyed.'
        end
          
        private
          
        def set_animal
          @animal = Aniaml.find(params[:id])
        end
          
        def animal_params
            params.require(:animal).permit(:name, :sighting)
        end

        def render_unprocessable_entity_response(invalid)
            render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
          end
end
