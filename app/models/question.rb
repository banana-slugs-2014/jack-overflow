class Question < Post
  has_many :answers
  validates_presence_of :title
  has_one :favorite, class_name: "Answer", foreign_key: :answer_id

  def assign_favorite(answer_id)
    update_attributes(favorite_id: answer_id)
  end

  class << self

    def votes_for_each
       Question.all.inject([]) do |votes, q|
        votes.push(q.vote_count)
        votes
      end
    end


    def sort_questions(how="all")
      case how
      when "by_time"
        sort_by_time
      when "by_vote_count"
        sort_by_vote_count
      when "by_trending"
        sort_by_trending
      else
        all
      end
    end

    private

    def sort_by_time
      Question.order('created_at DESC')
    end

    def sort_by_vote_count
      Question.all.sort_by(&:vote_count).reverse
    end

    def sort_by_trending
      Question.all.sort_by(&:trending)
    end
  end

end
