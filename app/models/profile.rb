class Profile < ActiveRecord::Base
  # belongs_to :author
  attr_accessor :remember_token, :changing_password

  has_secure_password
  
  validates :email, presence: true, 
                    length: { maximum: 60 }, 
                    email_format: true, 
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, if: :validate_password?
  validates :author_id, :role, presence: true
  
  before_create do
    self.email.downcase! if email
    # self.remember_token = SecureRandom.urlsafe_base64
    # self.author = Author.create!(name: 
      # self.email[/[^@]+/].gsub(".", " ").gsub("_", " ").titleize) 
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
    
private

  def validate_password?
    new_record? || changing_password || password_digest_changed?
  end
end