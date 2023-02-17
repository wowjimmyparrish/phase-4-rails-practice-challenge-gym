class MembershipsController < ApplicationController


    def create 
        member = Membership.create(member_params)
        if member.valid?
        render json: member, status: :created 
        else  
            render json: { errors: member.errors }, status: :unprocessable_entity
  end
    end

        private 

        def member_params 
            params.permit(:gym_id, :client_id, :charge)
        end
        
end
