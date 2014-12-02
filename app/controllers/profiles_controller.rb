class ProfilesController < ApplicationController
  def new
    @profile = env['omniauth.identity']
  end
  
  def edit
  end
  
  def destroy
    Profile.find(params[:id]).destroy
    redirect_to root_path, success: 'obrigado por honrar-nos com suas raspas'
  end
  
private
  
  def profile_params
    params.require(:profile).permit(:email, :password, :role, :author_id)
  end
end