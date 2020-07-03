class StaticController < ApplicationController

    skip_before_action :require_login, only: [:index]
    
    def index
    end

    def show 
        @users = User.all
        @locations = Location.all
    end 

    
end