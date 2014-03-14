class CommentsController < ApplicationController

  def new
    @post = Post.find params[:post_id]
    @comment = @post.comments.new
  end

  def create
    post = Post.find params[:post_id]
    comment = post.comments.build params[:comment]
    redirect_to post_path(post) and return if comment.save
    redirect_to post_path(post), notice: 'Invalid comment!'
  end

  def edit
    @post = Post.find params[:post_id]
    @comment = Comment.find params[:id]
  end

  def update
    post = Post.find params[:post_id]
    comment = post.comments.find params[:id]
    redirect_to post_path(post) and return if comment.update_attributes params[:comment]
    redirect_to post_path(post), notice: 'Invalid comment!'
  end

  def destroy
    comment = Comment.find params[:id]
    post = comment.post
    comment.destroy
    redirect_to post_path(post)
  end

end