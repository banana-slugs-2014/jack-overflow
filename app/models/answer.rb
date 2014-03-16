class Answer < Post
  belongs_to :question

  def assign_question_key(question_id)
    Question.find(question_id).answers << self
  end
end