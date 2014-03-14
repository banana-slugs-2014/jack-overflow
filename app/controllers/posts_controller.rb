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

  def edit

  end


end