class User < ActiveRecord::Base
  attr_accessible :username
  validates_presence_of :username, :password_digest
  validates_uniqueness_of :username
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :votes
end