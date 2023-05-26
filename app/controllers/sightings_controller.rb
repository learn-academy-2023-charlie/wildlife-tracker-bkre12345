class SightingsController < ApplicationController
    before_action :set_sighting, only: [:show, :update, :destroy]

    def index
        if params[:start_date].present? && params[:end_date].present?
            sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        else
        @sightings = Sighting.all
        end
        render json: @sightings
    end

    def show
        sighting = Sighting.includes(:animal).find(params[:id])
        render json: sighting, include: :animal
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
