class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_signup


    def create
        user = User.create(user_params_signup)
        @token = encoded_token({user_id: user.id})
        render json: {user: UserSerializer.new(user), jwt: token}, status: :created
    end

    def me
        render json: current_user, status: :ok
    end

    

private


    def user_params_signup
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def handle_invalid_signup(error)
        render json: { errors: e.record.errors.full_message }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "User not found" }, status: :not_found
    end
end
