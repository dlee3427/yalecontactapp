class SessionsController < ApplicationController 
    
    skip_before_action :authenticated, only: [:new, :create]

    def new 

    end 

    def create 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user 
        else 
            redirect_to "/login"
        end 
    end 


    def destroy 
        session.delete(:user_id)
        redirect_to "/login"
    end 

    private 


end 