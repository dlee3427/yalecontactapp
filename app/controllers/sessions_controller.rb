class SessionsController < ApplicationController 
    
    skip_before_action :require_login, only: [:new, :create]

    def new 

    end 

    def create 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path
        elsif !@user
            flash[:error] = "The email you entered is not registered."
            redirect_to login_path
        else
            flash[:error] = "The password you entered is incorrect."
            redirect_to login_path
        end 
    end 


    def destroy 
        reset_session
        redirect_to root_path
    end 

end 