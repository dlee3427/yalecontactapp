class ApplicationController < ActionController::Base

    before_action :require_login
    
    def require_login
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to login_path
        end
    end 
end
