class PostsController < ApplicationController

  def index
    @questions = Post.where(question_id: nil)
  end

  def show
    #by design to prevent the need to catch errors
    @question = Post.find_by_id(params[:id])
    redirect_to :back and return unless @question.is_a? Question
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
    @post = Post.find(params[:answer])
    @post.question.update_attributes(favorite_id: @post.id)
    redirect_to post_path(@post.question)
  end
end