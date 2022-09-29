class CampersController < ApplicationController

    # GET /campers
    def index 
        campers = Camper.all
        render json: campers, only: [:id, :name, :age], status: :ok
    end
    #  GET/campers/:id
    def show
        camper = find_camper
        if camper
          render json: camper, include: :activities, status: :ok
        else
          render json: { error: "Camper not found" }, status: :not_found
        end
    end
#    POST /campers
    def create 
        camper = Camper.create(camper_params)
        if camper.valid?
         render json: camper, status: :created
        else  
         render json: {errors: ["validation errors"]}, status: :unprocessable_entity
        end 
    end

    private
    def camper_params
        params.permit(:name, :age)
    end

    def find_camper
        Camper.find_by(id: params[:id])
    end
end