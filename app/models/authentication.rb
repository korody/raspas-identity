class Authentication < ActiveRecord::Base
  belongs_to :profile
  # attr_accessor :changing_password
  
  def self.with_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |authentication|
      authentication.provider = auth.provider
      authentication.uid = auth.uid
    end
  end
  
private

  # def validate_password?
  #   new_record? || changing_password || password_digest_changed?
  # end
end