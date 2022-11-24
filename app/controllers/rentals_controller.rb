class RentalsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    before_action :authorized, only: [:create, :destroy]
    def index
        rentals = Rental.all
        render json: rentals, status: :ok
    end
    def create
        if current_user
            rental = Rental.create(rental_params)
            render json: rental, status: :created
        end
    end

    def destroy
        user_id = decoded_token[0]["user_id"]
        rental = Rental.find_by(id: params[:id])
        if rental.user_id == user_id
            rental.destroy
            render json: rental, status: :ok
        end
    end
    
private

    def rental_params
        params.permit(:title, :price, :address, :area_sqft, :category, :starting_date, :image, :requirements, :user_id, :note, :status, :parking, :near_subway, :features, :location, :phone, :email, :utility, :description).merge(user_id: current_user.id)
    end

end
