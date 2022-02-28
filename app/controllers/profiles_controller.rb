class ProfilesController < ApplicationController
   
    def new
        #form where a user can fill out his own profile
        @user = User.find(params[:user_id])
        @profile = Profile.new              #@user.build_profile    #build_profile can be used cause we established a connection in the routes file (nested resources) we used it here to build a blank profile
    end
    
   def create
       @user = User.find(params[:user_id])
       @profile = @user.build_profile(profile_params)           #we use build_profile here to store the actual data that the user typed
       if @profile.save
           flash[:success] = "profile updated!"
           redirect_to user_path(params[:user_id])
       else
           render action: :new
       end
   end
   
   def edit
        @user = User.find(params[:user_id])
        @profile = @user.profile
   end
    
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :contact_email, :phone_number, :description)
        end
end