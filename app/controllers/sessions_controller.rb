class SessionsController < ApplicationController 
    
    skip_before_action :authenticated, only: [:new, :create]

    def new 

    end 

    def create 
        @user = User.find(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to root_path 
        else 
            flash[:error] = "Invalid Email/Password"
            redirect_to "/login"
        end 
    end 


    def destroy 
        session.delete(:user_id)
        redirect_to "/login"
    end 

    private 

    def login_params 
        params.permit(:email, :password)
    end 


end 