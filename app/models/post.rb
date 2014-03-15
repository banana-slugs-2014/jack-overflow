class Post < ActiveRecord::Base
  attr_accessible :title, :body, :question_id, :type

  has_many :comments
  has_many :votes
  belongs_to :user
  validates_presence_of :body

  def vote_count
    votes.pluck(:value).inject(&:+)
  end

  def trending
    # youth * number of comments
    ( 1/ ( Time.now - created_at ) ) * comments.count
  end

  def self.select_options
    descendants.map{ |c| c.to_s }.sort
  end
end

