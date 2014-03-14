class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new params[:comment]
    redirect_to post_path(@comment.post) and return if @comment.save
    redirect_to post_path(@comment.post), notice: 'Invalid comment!'
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    redirect_to post_path(@comment.post) and return if @comment.update_attributes params[:comment]
    redirect_to post_path(@comment.post), notice: 'Invalid comment!'
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to :back
  end

end