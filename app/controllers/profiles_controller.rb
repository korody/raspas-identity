class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new profile_params
    if @profile.save
      sign_in @profile
      redirect_to root_path, success: 'Bem-vindo ao raspas!'
    else
      render :new
    end
  end

  def edit
  end
  
private
  
  def profile_params
    params.require(:profile).permit(:email, :password, :role, :author_id)
  end
end