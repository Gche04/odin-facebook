class ProfilesController < ApplicationController

    def new
        @profile = Profile.new
    end

    def create
        user = User.find(current_user.id)
        @profile = user.build_profile(profile_params)
    
        if @profile.save
            redirect_to user_url(current_user.id)
        end
    end

    def edit
        @profile = Profile.find(params[:id])
    end
    
    def update
        @profile = Profile.find(params[:id])
        
        if @profile.update(profile_params)
            redirect_to user_url(current_user.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:user_id, :avatar, :other_name, :gender, :country)
    end

end