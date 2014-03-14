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

  def create
    @post =Post.new(params[:post])
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update #helper method to determine Q/A?
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      if @post.parent_id.nil?
        redirect_to(post_path(@post.id))
      else
        redirect_to(post_path(@post.parent_id))
      end
    else
      redirect_to(edit_post_path(params[:id]))
    end
  end
end