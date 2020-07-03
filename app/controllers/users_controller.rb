class UsersController < ApplicationController 

    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new 
        @colleges = ResCollege.all
    end 

    def create 
        @user = User.new(user_params)

        if @user.valid? 
            @user.save

            #logs user in
            session[:user_id] = @user.id

            flash[:notice] = "To participate in Yale's contact tracing program, you must first submit a test result."
            redirect_to new_test_path
        else 
            redirect_to register_path
        end 
    end

    def show
        @recent_visits = @user.visits.order(start_time: :desc).limit(5)
        @recent_tests = @user.tests.order(start_time: :desc).limit(5)
    end


    private 

    def user_params 
        params.require(:user).permit(
            :name, 
            :email, 
            :password, 
            :password_confirmation,
            :class_year,
            :res_college_id
        )
    end 

   
end 