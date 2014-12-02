class AuthenticationsController < ApplicationController
  def destroy
    authentication = Authentication.find(params[:id]).destroy
    redirect_to current_user.author, success: "perfil desvinculado com sucesso"
  end
end