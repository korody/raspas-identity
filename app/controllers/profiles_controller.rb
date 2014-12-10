class ProfilesController < ApplicationController
  before_action :find_profile, only: [:edit, :update]
  
  def new
    @profile = env['omniauth.identity']
  end
  
  def edit
  end
  
  def update
    if @profile.update_attributes(profile_params)
      redirect_to edit_profile_path(current_user), success: "conta atualizada"
    else
      render :edit
    end
  end
  
  def destroy
    @profile.destroy
    redirect_to root_path, success: "obrigado por honrar-nos com suas raspas"
  end
  
private

  def find_profile
    @profile = current_user
  end
  
  def profile_params
    params.require(:profile).permit(:email, :password, :role, :author_id)
  end
end