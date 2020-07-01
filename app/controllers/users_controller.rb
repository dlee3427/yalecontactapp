class UsersController < ApplicationController 

    skip_before_action :authenticated, only: [:new, :create]

    def new
        @user = User.new 
        @colleges = ResCollege.all
    end 

    def create 
        @user = User.new(user_params)

        if @user.valid? 
            @user.save 
            redirect_to @user
        else 
            redirect_to "/signup"
        end 
    end 

    def show 
        
        @user = User.find(params[:id])
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