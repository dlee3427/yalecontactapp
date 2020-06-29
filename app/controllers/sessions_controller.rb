class SessionsController < ApplicationController 
    
    def new 

    end 

    def create 
        @user = User.find(email: login_params[:email])
        if @user.valid? 
            session[:user_id] = @user.id
            redirect_to "/"
        else 
            flash[:login_error] = "Invalid!"
            redirect_to "/login"
        end 
    end 


    def destroy 
        session.delete :username 
    end 

    private 

    def login_params 
        params.require[:login].permit(:email, :password)
    end 


end 