class PostsController < ApplicationController
  def index
    @questions = Post.where(parent_id: nil)
  end


end