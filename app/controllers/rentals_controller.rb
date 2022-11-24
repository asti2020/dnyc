class RentalsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    def index
        rentals = Rental.all
        render json: rentals, status: :ok
    end
end
