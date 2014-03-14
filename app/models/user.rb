class User < ActiveRecord::Base
  attr_accessible :username
  validates_presence_of :username, :password_digest
  has_secure_password
  has_many :posts
end