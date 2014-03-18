class PostsController < ApplicationController
  before_filter :protect_route, except: [:index, :show]

  def index
    @questions = Question.sort_questions(params[:sort])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: Question.votes_for_each }
    end
  end

  def show
    @post = params[:type].constantize.find parmas[:id]

    redirect_to :back and return unless @post
    @answers = @post.answers.sort_by(&:vote_count).reverse
    @favorite_answer = @post.favorite
    if @favorite_answer
      @answers -= [@favorite_answer]
    end
  end

  def new
    @post = Post.new
  end

  def create
    # html5 validation for blank form
    # use the same logic of .constantize as the show.
    if params[:post][:question_id]
      @post = Answer.create(params[:post])
      @post.assign_question_key(params[:post][:question_id])
      @post.assign_user_key(session[:user_id])
      render partial: "posts/answer", locals: { answer: @post, question: @post.question }
    else
      @post = Question.create(params[:post])
      @post.assign_user_key(session[:user_id])
      redirect_to post_path(@post.id)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # this line repeats, move it to a before_filter
    @post = Post.find(params[:id])
    redirect_to post_path(@post.update_router(params[:post]))
  end

  def favorite
    @answer = Answer.find(params[:answer])
    @answer.question.assign_favorite(@answer.id)
    redirect_to post_path(@answer.question)
  end
end
