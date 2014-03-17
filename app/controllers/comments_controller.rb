class CommentsController < ApplicationController
  before_filter :grab_post, except: :destroy

  def new
    @comment = @post.comments.new
  end

  def create
    comment = @post.build_comment params[:comment]
    comment.save
    render partial: 'comments/comment', locals: {comment: comment}
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    comment = @post.find_comment params[:id]
    redirect_to post_path(@post) and return if comment.update_attributes params[:comment]
    redirect_to post_path(@post), notice: 'Invalid comment!'
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to post_path(comment.post)
  end

  private

  def grab_post
    @post = Post.find params[:post_id]
  end

end