class MeetingsController < ApplicationController
    def index
        meetings = Meeting.all
        render json: meetings, status: :ok
    end

    def show 
        meeting = Meeting.find_by(id: params[:id])
        render json: meeting, status: :ok
    end

    def create
        if current_user
            meeting = Meeting.create(meeting_params)
            render json: meeting, status: :created
        else 
            render json: {message: "Please log in"}, status: :unauthorized
        end
    end

    def update
        meeting = Meeting.find_by(id: params[:id])
        if meeting.user_id == current_user.id
            meeting.update(meeting_params)
            render json: meeting, status: :ok
        end
    end

    def destroy
        meeting = Meeting.find_by(id: params[:id])
        if meeting.user_id == current_user.id
            meeting.destroy
            render json: meeting, status: :ok
        end
    end
private 

    def meeting_params
        params.permit( :title, :start_date, :end_date, :start_time, :end_time, :time_meeting)
    end
end
