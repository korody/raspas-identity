class Profile < OmniAuth::Identity::Models::ActiveRecord
  belongs_to :author
  has_many :authentications
  attr_accessor :remember_token

  validates :email, length: { maximum: 60 }, 
                    email_format: true,
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :role, presence: true
  
  before_create do
    self.email.downcase! if email
    self.author = Author.create!(name: 
      self.email[/[^@]+/].gsub(".", " ").gsub("_", " ").titleize)
  end
    
  def Profile.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def Profile.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Profile.new_token
    update_attribute(:remember_digest, Profile.digest(remember_token))
  end
  
   def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |profile|
      profile.email = auth.info.email
      # profile.origin = auth.info.location
      # profile.bio = auth.info.description
      # profile.image = auth.info.image
      # profile.website = auth.extra.raw_info.link 
      # profile.image = auth.extra.raw_info.image
      profile.password = rand(36**10).to_s(36)
      # profile.oauth_token = auth.credentials.token
      # profile.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?
      # profile.save!
    end
  end
end