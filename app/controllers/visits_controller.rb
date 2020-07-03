class VisitsController < ApplicationController 

    def index
        @visits = @user.visits.order(start_time: :desc)
    end
    
    def new
        @visit = Visit.new
    end 

    def create 
        @visit = Visit.new(visit_params)
        @visit.user = User.find_by_id(session[:user_id])
        @visit.contagious = @visit.user.contagious?
        @visit.save
        redirect_to user_path(@visit.user)
    end 

    private 

    def visit_params
        params.require(:visit).permit(
            :location_id,
            :start_time,
            :end_time
        )
    end 


end 



