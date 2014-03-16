class VotesController < ApplicationController

  def create
    if session[:user_id]
      vote = User.find(session[:user_id]).votes.new(value: params[:value])
      vote.post = Post.find(params[:post_id])
      if vote.save
        p Vote.count
        # render partial: 'vote_count' , locals: { post: vote.post }
      else
        # render partial: :errors, locals: { error: vote.errors.full_messages }
      end
    else
      # render partial: 'shared/sign_in_error'
    end
    redirect_to post_path(vote.post.id)
  end

  def update
    vote = User.find(session[:user_id]).votes.where(id: params[:vote_id]).first
    if vote.update_attributes params[:vote]
      render partial: 'vote_count', locals: { post: vote.post }
    else
      # render partial: :errors, locals: { error: vote.errors.full_messages }
    end
  end

end