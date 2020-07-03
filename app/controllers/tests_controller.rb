class TestsController < ApplicationController 

    before_action :find_user, only: [:new, :create]
    def new 
        @test = Test.new
    end 

    # User inputs a new test
    def create
        # instantiate the test with its details
        @test = Test.new(test_params)

        # associate the test with the currently logged in user
        @test.user = @user

        # if a user submits a positive test
        if @test.result == 'positive'
            # updates the user's new visits as contagious
            @test.user.update_new_visits_as_contagious
            @test.save

            # if it's the user's first positive test
            if @test.user.last_test.result == 'negative'
                #identify possible transmissions from the last two weeks
                @test.user.find_possible_transmissions
            end
        end

        # saves test to database
        @test.save
        
        #redirect to user show page
        redirect_to user_path(@test.user)
    end 


    private 

    def test_params 
        params.require(:test).permit(
            :user_id,
            :date,
            :facility_id,
            :result
        )
    end

    def find_user
        @user = User.find(session[:user_id])
    end

end 

