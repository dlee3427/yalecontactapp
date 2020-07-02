class VisitsController < ApplicationController 

    def new
        @visit = Visit.new
    end 

    def create 
        @visit = Visit.new(visit_params)
        @visit.user = User.find_by(session[:user_id])
        @visit.save
        redirect_to user_path(@visit.user)
    end 

    private 

    def visit_params
        params.require(:visit).permit(
            :location_id,
            :start_time,
            :end_time,
            :contagious
        )
    end 


end 
