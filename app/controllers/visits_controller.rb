class VisitsController < ApplicationController 

    def new
        @visit = Visit.new
    end 

    def 

    end 

    private 

    def visit_params
        params.require(:visit).permit(
            

        )
    end 


end 
