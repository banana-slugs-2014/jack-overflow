class PostsController < ApplicationController
  def index
    @questions = Post.where(parent_id: nil)
  end

  def show
    #by design to prevent the need to catch errors
    @question = Post.find_by_id(params[:id])
    redirect_to root_path and return unless @question
    @answers = @question.answers
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    redirect_to :back if @post.update_attributes(params)
    redirect_to edit_post_path(params[:id])
  end


end