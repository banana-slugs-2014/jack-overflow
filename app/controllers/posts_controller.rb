class PostsController < ApplicationController
  before_filter :protect_route, except: [:index, :show]

  def index
    @questions = Question.all
  end

  def show
    #find_by_id by design to prevent the need to catch errors
    @question = Question.find_by_id(params[:id])
    redirect_to :back and return unless @question
    @answers = @question.answers
  end

  def new
    @post = Post.new
  end

  def create
    if params[:post][:question_id]
      @post = Answer.create(params[:post])
      @post.assign_question_key(params[:post][:question_id])
      @post.assign_user_key(session[:user_id])
    else
      @post = Question.create(params[:post])
      @post.assign_user_key(session[:user_id])
    end
    redirect_to post_path(@post.create_router)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    redirect_to post_path(@post.update_router(params[:post]))
  end

  def favorite
    @answer = Answer.find(params[:answer])
    @answer.question.assign_favorite(@answer.id)
    redirect_to post_path(@answer.question)
  end
end