class StaticController < ApplicationController

    def index
    end

    def show 
        @users = User.all
    end 

    
end