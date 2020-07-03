class StaticController < ApplicationController

    skip_before_action :require_login, only: [:index]
    
    def index
    end

    def show 
        @users = User.all
        @locations = Location.all
        @active_cases = User.count{|user| user.contagious?}
        @recovered_cases = User.count{|user| !user.contagious? && user.tests.any?{|test| test.result == "positive"}}
    end 

    
end