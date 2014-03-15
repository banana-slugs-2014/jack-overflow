class Answer < Post
  belongs_to :question
  validates_presence_of :question_id
end