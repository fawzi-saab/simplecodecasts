class ProfilesController < ApplicationController
    def new
        #form where a user can fill out his own profile
        @user = User.find(params[:user_id])
        @profile = @user.build_profile    #build_profile can be used cause we established a connection in the routes file (nested resources)
    end
end