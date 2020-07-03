class TestsController < ApplicationController 

    before_action :find_user, only: [:new, :create]

    def index
        @tests = @user.tests.order(date: :desc)
    end

    def new 
        @test = Test.new
    end 

    # User inputs a new test
    def create
        # instantiate the test with its details
        last_test = @user.last_test
        @test = Test.new(test_params)

        # associate the test with the currently logged in user
        @test.user = @user
        if @test && @test.valid?
            # if a user submits a positive test
            if @test.result == 'positive'
                # updates the user's new visits as contagious
                @test.user.update_new_visits_as_contagious
                @test.save

                # if it's the user's first positive test
                if last_test.result == 'negative'
                    #identify possible transmissions from the last two weeks
                    @test.user.find_possible_transmissions(last_test)
                end
            end
        elsif !@test.date 
            flash[:notice] = "You must submit a date!"
            redirect_to "/tests/new" and return
        else
            flash[:notice] = "You must submit a test result!"
            redirect_to "/tests/new" and return
        end
        # saves test to database
        @test.save
        
        #redirect to user show page
        redirect_to user_path
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

