class Post < ActiveRecord::Base
  attr_accessible :title, :body, :question_id
  belongs_to :question, class_name: 'Post'

  has_many :answers, class_name: 'Post',
                     foreign_key: "question_id"
  has_many :comments
  belongs_to :user
  validates_presence_of :body

  def self.select_options
    descendants.map{ |c| c.to_s }.sort
  end
end

