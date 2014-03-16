class VotesController < ApplicationController

  def create
    # if session[:user_id]
      vote = User.first.votes.build(value: params[:value].to_i)
      vote.post = Post.find(params[:post_id])
      vote.save
    # end
    render nothing: true
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