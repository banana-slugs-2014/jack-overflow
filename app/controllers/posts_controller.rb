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

    # Pending helper method to detemine Post.type
    # and assign proper keys
    if params[:post][:question_id]
      @post = Answer.new(params[:post])
      if @post.save
        question = Question.find(params[:post][:question_id])
        question.answers << @post
        user = User.find(session[:user_id])
        user.posts << @post
      end
    else
      @post = Question.new(params[:post])
      if @post.save
        user = User.find(session[:user_id])
        user.posts << @post
      end
    end

      redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update #helper method to determine Q/A?
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      if @post.question_id.nil?
        redirect_to(post_path(@post.id))
      else
        redirect_to(post_path(@post.question_id))
      end
    else
      redirect_to(edit_post_path(params[:id]))
    end
  end

  def favorite
    @post = Post.find(params[:answer])
    @post.question.update_attributes(favorite_id: @post.id)
    redirect_to post_path(@post.question)
  end
end