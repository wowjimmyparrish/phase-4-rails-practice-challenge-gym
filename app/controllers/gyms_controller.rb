class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show 
        gym = Gym.find(params[:id]) 
        render json: gym
    end

    def destroy
        gym = Gym.find_by(params[:id])
          gym.destroy
          render json:{}, status: :no_content
      end

        private

  def render_not_found_response
    render json: { error: "Gym not found" }, status: :not_found
  end
end
