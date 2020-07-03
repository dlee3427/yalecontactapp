class StaticController < ApplicationController

    skip_before_action :require_login, only: [:index, :show]
    
    def index
    end

    def show 
        @users = User.all
        @locations = Location.all
    end 

    
end