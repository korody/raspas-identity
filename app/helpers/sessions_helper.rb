module SessionsHelper
  def sign_in(profile)
    session[:profile_id] = profile.id
  end
  
  def remember(profile)
    profile.remember
    cookies.permanent.signed[:profile_id] = profile.id
    cookies.permanent[:remember_token] = profile.remember_token
  end

  def current_user
    if (profile_id = session[:profile_id])
      @current_user ||= Profile.find_by(id: profile_id)
    elsif (profile_id = cookies.signed[:profile_id])
      profile = Profile.find_by(id: profile_id)
      if profile && profile.authenticated?(cookies[:remember_token])
        sign_in profile
        @current_user = profile
      end
    end
  end

  def current_user?(profile)
    profile == current_user
  end

  def signed_in?
    !!current_user
  end
  
  # def current_user=(profile)
  #   @current_user = profile
  #   session[:profile_id] = profile.nil? ? profile : profile.id
  # end
  
  def forget(profile)
    profile.forget
    cookies.delete(:profile_id)
    cookies.delete(:remember_token)
  end

  def sign_out
    forget current_user
    session.delete(:profile_id)
    @current_user = nil
  end
  
  def sign_out_and_delete(profile)
    profile.destroy
    session.delete(:profile_id)
    cookies.delete(:profile_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, notice: "ei, é você mesmo?"
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  private

  def store_location
    session[:return_to] = request.fullpath
  end
end