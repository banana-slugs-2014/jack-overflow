class Answer < Post
  belongs_to :question

  #
  def assign_question_key(question)
    self.question = question # no value in this method.
  end
end
