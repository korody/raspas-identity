class Author < ActiveRecord::Base
  validates :name, length: { minimum: 2 }

  has_one :profile
  # has_many :authentications, through: :profile
  
  # delegate :image, to: :profile
  
  before_create do
    self.username = name.gsub(/\s+/, "").downcase
    self.slug ||= name.parameterize
  end
  
  def to_param
    username
  end
  
  def alive?
    !self.dod
  end
  
  def taken?
    !!self.profile
  end
end