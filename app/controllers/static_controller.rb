class StaticController < ApplicationController
    skip_before_action :require_login

    def index
    end

    def show 
        @users = User.all
    end 

    
end