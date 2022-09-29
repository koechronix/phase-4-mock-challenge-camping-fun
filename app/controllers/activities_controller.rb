class ActivitiesController < ApplicationController
    # GET /activities
    def index
        activities = Activity.all
        render json: activities, only: [:id, :name, :difficulty]
    end

    # DELETE/ activities/:id
    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
            activity.destroy
            render jaon: {}, status: :ok
        else
          render json: {error: "Activity not found"}, status: :not_found
        end
    end
end
