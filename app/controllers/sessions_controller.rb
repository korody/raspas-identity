class SessionsController < ApplicationController
  def new
  end
  
  def create
    auth = env["omniauth.auth"]
    if auth
      # Find an authentication or create an authentication
      @authentication = Authentication.with_omniauth(auth)
      if signed_in?
        if @authentication.profile == current_user
          # profile is signed in so they are trying to link an authentication with their
          # account. But we found the authentication and the profile associated with it 
          # is the current profile. So the authentication is already associated with 
          # this profile. So let's display an error message.
          redirect_to root_path, info: "Esta conta já está conectada."
        else
          # The authentication is not associated with the current_user so lets 
          # associate the authentication
          @authentication.profile = current_user
          @authentication.save
          redirect_to root_path, success: "Conta autorizada com sucesso"
        end
      else # no profile is signed_in
        if @authentication.profile.present?
          # The authentication we found had a profile associated with it so let's 
          # just log them in here
          params[:remember_me] == '1' ? remember(@authentication.profile) : forget(@authentication.profile)
          sign_in @authentication.profile
          redirect_to current_user.author, success: "Bem-vindo(a) de volta."
        else
          # The authentication has no profile assigned and there is no profile signed in
          if @authentication.provider == 'identity'
            profile = Profile.find(@authentication.uid)
            # If the provider is identity, then it means we already created a user
            # So we just load it up
          else
            # Look for a profile with same email or create a new one
            profile = Profile.from_omniauth(auth)
          end
          # We can now link the authentication with the profile and log him in
          profile.authentications << @authentication
          sign_in profile
          redirect_to current_user.author, success: "Bem-vindo(a) ao raspas!"
        end
      end
    else
      flash.now[:danger] = "senha ou e-mail incorretos"
      render 'new'
    end
  end

  # def create
  #   if env["omniauth.auth"]
  #     profile = Profile.from_omniauth(env["omniauth.auth"])
  #     params[:remember_me] == '1' ? remember(profile) : forget(profile)
  #     sign_in profile
  #     redirect_back_or root_path
  #   else
  #     flash.now[:danger] = "senha ou e-mail incorretos"
  #     render 'new'
  #   end
  # end

  def destroy
    sign_out if signed_in?
    redirect_to root_path, success: "até breve!"
  end
end