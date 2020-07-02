class VisitsController < ApplicationController 

    def new
        @visit = Visit.new
    end 

    def create 

        @visit.user = User.find(session[:user_id])
        @visit.save 
        redirect_to user_path(@visit.user)
    end 

    private 

    def visit_params
        params.require(:visit).permit(
            :location_id,
            :start_time

        )
    end 


end 
