class SaveRentalsController < ApplicationController
    before_action :authorized, only: [:create, :destroy, :index]

    def index 
        save_rentals = SaveRental.all
        render json: save_rentals, status: :ok
    end


    def create
        if current_user
            rental = SaveRental.create(save_rental_params)
            render json: rental, status: :created
        else
            render json: { error: "You must be logged in to create a rental"}, status: :unprocessable_entity
        end
    end

    def destroy
        if current_user.id == SaveRental.find_by(id: params[:id]).user_id
            SaveRental.find_by(id: params[:id]).destroy
            render json: { success: true }, status: :ok
            return
        end
    end

private

    def save_rental_params  
        params.permit(:isSave).merge(user_id: current_user.id).merge(rental_id: params[:rental_id])
    end
    
end
