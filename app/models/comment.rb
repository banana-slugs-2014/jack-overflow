class Comment < ActiveRecord::Base
  attr_accessible :body
  validates :body, :presence => true
  belongs_to :post
  belongs_to :user
end
