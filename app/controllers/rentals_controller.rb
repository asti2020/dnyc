class RentalsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    before_action :authorized, only: [:create, :update ,:destroy, :rentalsuser]


    def index
        rentals = Rental.all
        render json: rentals, status: :ok
    end

    def rentalsuser
        user = current_user
        rentals  = Rental.all
        render json: user.rentals, status: :ok
    end

    def create
        
        if current_user
                address = params[:address]
                geocoder = Geocoder.search(address)
                lat = geocoder.first.coordinates[0]
                lng = geocoder.first.coordinates[1]
                debugging = {lat: lat, lng: lng}
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
    def update
        rental = Rental.find_by(id: params[:id])
        if rental.user_id == current_user.id
            rental.update(rental_params_update)
            render json: rental, status: :ok
        end
    end

    def show
        rental = Rental.find_by(id: params[:id])
        render json: rental, status: :ok
    end


private

    def rental_params
        params.permit(:title, :price, :address, :area_sqft, :category, :starting_date, :image, :requirements, :user_id, :note, :status, :parking, :near_subway, :features, :location, :phone, :email, :utility, :description, :latitude, :longitude).merge(user_id: current_user.id)
    end
    def rental_params_update
        params.permit(:title, :price, :address, :area_sqft, :category, :starting_date, :image, :requirements, :note, :status, :parking, :near_subway, :features, :location, :phone, :email, :utility, :description)
    end

end
