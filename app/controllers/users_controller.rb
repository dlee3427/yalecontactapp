class UsersController < ApplicationController 

    def new 
    end 

    def create 
        user = User.new(user_params)
        if user.valid? 
            user.save 
        else 
            flash[:register_error] = @user.errors.full_messages
            redirect_to "users/new"
        end 
        redirect_to root_path 
    end 

    private 

    def user_params 
        params.require(:users).permit(
            :name, 
            :email, 
            :password, 
            :password_confirmation,
            :class_year,
            :residential_college
        )
    end 

   
end 