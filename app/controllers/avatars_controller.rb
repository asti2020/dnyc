class AvatarsController < ApplicationController
    before_action :authorized, only: [:update, :show, :index]


    def avatar
        user = current_user
        if user.avatar.attached?
            user.update(avatar_params)
            render json: user.avatar, status: :ok
        end
    end

    def update
        user = current_user
        # avatar = Avatar.find_by(user_id: user.id)
        if user.avatar.attached?
            avatar.update(avatar_params)
            render json: avatar, status: :ok
        # user.avatar.attach(params[:avatar])
        # redirect_to user_path(user)
    end
end
    # def index
    #     user = current_user
    #     avatar = Avatar.find_by(user_id: user.id)
    #     render json: avatar, status: :ok
    # end

# def create
#     user = current_user
#     avatar = Avatar.create(avatar_params)
#     render json: avatar, status: :created
# end


#     def create
#         avatar = Avatar.create(avatar_params)
#         render json: avatar, status: :created
#     end

#     def destroy
#         avatar = Avatar.find_by(id: params[:id])
#         avatar.destroy
#         render json: avatar, status: :ok
#     end

#     def update
#         avatar = Avatar.find_by(id: params[:id])
#         avatar.update(avatar_params)
#         render json: avatar, status: :ok
#     end

    def show
        avatar = Avatar.find_by(id: params[:id])
        render json: avatar, status: :ok
    end

private

    def avatar_params
        params.permit(:image, :user_id).merge(user_id: current_user.id)
    end
end
