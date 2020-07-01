class TestsController < ApplicationController 


    def new 
        @test = Test.new
    end 

    def create 
        @test = Test.create(test_params)
        @test.user = User.find(session[:user_id])
        @test.save         
        redirect_to user_path(@test.user)
    end 

    def show 
        @test = Test.find_by(params[:id])
    end 

    private 

    def test_params 
        params.require(:test).permit(
            :date,
            :facility_id,
            :result,
        )
    end 

end 

