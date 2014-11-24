class EmailAddress
  WELL_FORMED_EMAIL_ADDRESS = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def self.malformed?(email)
    email !~ WELL_FORMED_EMAIL_ADDRESS
  end
end