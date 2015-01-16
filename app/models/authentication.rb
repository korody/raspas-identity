class Authentication < ActiveRecord::Base
  belongs_to :profile
  
  AUTH_PROVIDERS = %w[facebook twitter google]
  
  def self.with_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |authentication|
      authentication.provider = auth.provider
      authentication.uid = auth.uid
      authentication.oauth_token = auth.credentials.token
      authentication.oauth_expires_at = Time.at(auth.credentials.expires_at)
      authentication.image = auth.info.image
    end
  end
  
  def self.auth_providers
    AUTH_PROVIDERS
  end
end