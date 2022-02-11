class ProfilesController < ApplicationController
  def update
    @profile = Profile.find(params[:id])
    @user = User.find(params[:user_id])
    if @profile.update(profile_params)
      flash[:success] = "更新しました!"
      redirect_to user_path(@profile, @user)
    else
      redirect_to user_path(@profile, @user)
    end
  end
  
  private
  
    def profile_params
      params.require(:profile).permit(:content)
    end
end
