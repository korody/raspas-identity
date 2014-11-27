class SessionsController < ApplicationController
  def new
  end

  def create
    profile = Profile.find_by(email: params[:email])
    if profile && profile.authenticate(params[:password])
      sign_in profile
      params[:remember_me] == '1' ? remember(profile) : forget(profile)
      redirect_back_or root_path
    else
      flash.now[:danger] = "senha ou e-mail incorretos"
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_path, success: "até breve!"
  end
end