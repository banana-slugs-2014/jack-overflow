class Question < Post
  has_many :answers
  validates_presence_of :title
  has_one :favorite, class_name: "Answer", foreign_key: :answer_id

  class << self
    def sort_questions(how)
      case how
      when :by_time
        sort_by_time
      when :by_vote_count
        sort_by_vote_count
      when :by_trending
        sort_by_trending
      end
    end

    private
    def sort_by_time
      Question.all.sort_by(&:created_at)
    end

    def sort_by_vote_count
      Question.all.sort_by(&:vote_count)
    end

    def sort_by_trending
      Question.all.sort_by(&:trending)
    end
  end

end