class Profile < ActiveRecord::Base
  # belongs_to :author

  has_secure_password
  
  validates :email, presence: true, 
                    length: { maximum: 60 }, 
                    email_format: true, 
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, if: :validate_password?
  validates :author_id, :role, presence: true
  
  before_create do
    self.email.downcase! if email
    self.remember_token = SecureRandom.urlsafe_base64
    # self.author = Author.create!(name: 
      # self.email[/[^@]+/].gsub(".", " ").gsub("_", " ").titleize) 
    end
    
private

  def validate_password?
    new_record? || changing_password || password_digest_changed?
  end
end