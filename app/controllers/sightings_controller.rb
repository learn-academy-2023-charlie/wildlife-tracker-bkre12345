class SightingsController < ApplicationController
    before_action :set_sighting, only: [:show, :update, :destroy]

    def index
        @sightings = Sighting.all
        render json: @sightings
    end

    def show
        render json: @sighting
    end

    def create
        @sighting = Sighting.new(sighting_params)

        if @sighting.save
            render json: @sighting, status: :created
        else
            render json: @sighting.errors, status: :unprocessable_entity
        end
    end

    def update
       if @sighting.update(sighting_params)
        render json: @sighting
       else
        render json: @sighting.errors, status: :unprocessable_entity
       end
    end

    def destroy
        @sighting.destroy
        render json: { message: "Deleted" }
    end

    private

    def set_sighting
        @sighting = Sighting.find(params[:id])
    end

    def sighting_params
        params.require(:sighting).permit(:location, :date, :animal_id)
    end
end
