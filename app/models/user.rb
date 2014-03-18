class User < ActiveRecord::Base
  has_secure_password # go read the code.

  attr_accessible :username, :password
  validates_presence_of :username
  validates_uniqueness_of :username
  has_many :posts
  has_many :comments
  has_many :votes

  def username
    self.username.humanize
  end
end
