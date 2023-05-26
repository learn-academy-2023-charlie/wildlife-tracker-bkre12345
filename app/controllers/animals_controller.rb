class AnimalsController < ApplicationController
    def index
        @animals = Animal.AnimalsController
        render json:@animals
    end

    def show
        render json:@animal

    end

    def create
        @animal = Animal.new(animal_params)
        if @animal.save
            render json:@animal, status: :created
        else
            render json:@animal.errors, status: :not_processed
        end
    end

    def update
        if @animal.update(animal_params)
            render json: @animal
        else
            render json: @animal.errors, status: :not_processed
        end

    end

    def destroy
        @animal.destroy

    end
    skip_before_action :verify_authenticity_token
end
