class Author < ActiveRecord::Base
  validates_presence_of :name

  has_one :profile
  has_many :authentications, through: :profile
  
  # delegate :image, to: :profile
  
  before_create do
    self.username = name.gsub(/\s+/, "").downcase
    self.slug ||= name.parameterize
  end
  
  def to_param
    username
  end
end