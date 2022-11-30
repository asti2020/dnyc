class BookingsController < ApplicationController

    def index
        bookings = Booking.all
        render json: bookings, status: :ok
    end

    def show 
        booking = Booking.find_by(id: params[:id])
        render json: booking, status: :ok
    end

    def create
        if current_user
            booking = Booking.create(booking_params)
            render json: booking, status: :created
        else 
            render json: {message: "Please log in"}, status: :unauthorized
        end
    end


private

    def booking_params
        params.permit(:user_id, :meeting_id, :date, :time, :location, :duration, :notes)
    end
    end
end
