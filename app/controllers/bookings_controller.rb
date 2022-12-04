class BookingsController < ApplicationController
    before_action:authorized, only: [:create, :update, :destroy]
    def index
            user = current_user
            bookings = Booking.all
            bookings = user.bookings
            render json: bookings, status: :ok
    end

    def show 
        booking = Booking.find_by(id: params[:id])
        render json: booking, status: :ok
    end

    def create
        if current_user
            booking = Booking.create(booking_params)
            booking.user_id = current_user.id 
            booking.isBooked = true
            booking.save
            render json: booking, status: :created
        else
            render json: {message: "Please log in"}, status: :unauthorized
        end

        #     booking = Booking.create(booking_params)
        #     render json: booking, status: :created
        # else 
        #     render json: {message: "Please log in"}, status: :unauthorized
        # end
    end


private

    def booking_params
        params.permit(:user_id, :meeting_id, :date, :time, :email, :message).merge(user_id: current_user.id).merge(isBooked: true).merge(rental_id: params[:rental_id])
    end

end
