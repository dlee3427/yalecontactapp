class UsersController < ApplicationController 

    skip_before_action :require_authorization, only: [:new, :create]

    def new
        @user = User.new 
        @colleges = ResCollege.all
    end 

    def create 
        @user = User.new(user_params)

        if @user.valid? 
            @user.save 
            redirect_to register_path
        else 
            redirect_to user_path
        end 
    end 

    def show
    end 

    private 

    def user_params 
        params.permit(
            :name, 
            :email, 
            :password, 
            :password_confirmation,
            :class_year,
            :res_college_id
        )
    end 

   
end 