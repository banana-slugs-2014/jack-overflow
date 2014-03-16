class Vote < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :post
  attr_accessible :value
  validates_inclusion_of :value, :in => -1..1
  # ALLOWS A USER TO VOTE ONE TIME!
  # validates :post_id, uniqueness: { scope: :user_id }
end