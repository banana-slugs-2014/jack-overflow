class Vote < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :post
  attr_accessible :value

end