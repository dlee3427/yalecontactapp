class UsersController < ApplicationController 

    # skip_before_action :authenticated, only: [:new, :create]

    def new
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.valid? 
            @user.save 
            redirect_to @user 
        else 
            flash[:register_error] = @user.errors.full_messages
            redirect_to "/signup"
        end 
        redirect_to root_path 
    end 

    def show 
        user = User.find(session[:user_id])
    end 

    private 

    def user_params 
        params.permit(
            :name, 
            :email, 
            :password, 
            :password_confirmation,
            :class_year,
            :residential_college
        )
    end 

   
end 