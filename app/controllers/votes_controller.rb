class VotesController < ApplicationController

  def create
    vote = User.find(session[:user_id]).votes.new params[:vote]
    vote.post = Post.find(params[:id])
    render partial: 'votes/vote_count' , locals: { post: vote.post } and return if vote.save
    render partial: :errors, locals: { error: @vote.errors.full_messages }
  end

  def update
  end

end