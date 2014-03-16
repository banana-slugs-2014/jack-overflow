class Post < ActiveRecord::Base
  attr_accessible :title, :body, :question_id, :type, :favorite_id

  has_many :comments
  has_many :votes
  belongs_to :user
  validates_presence_of :body

  def vote_count
    grab_votes ? grab_votes : "0"
  end

  def trending
    # youth * number of comments
    ( 1/ ( Time.now - created_at ) ) * (comments.count + 1)
  end

  def self.select_options
    descendants.map{ |c| c.to_s }.sort
  end

  private

  def grab_votes
    votes.pluck(:value).inject(&:+)
  end
end

