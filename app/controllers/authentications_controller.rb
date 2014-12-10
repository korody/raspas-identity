class AuthenticationsController < ApplicationController
  def destroy
    authentication = Authentication.find(params[:id]).destroy
    redirect_to edit_profile_path(current_user), success: "perfil desvinculado"
  end
end