class VotesController < ApplicationController
  before_filter :protect_route, only: [:create, :update]

  def create
    vote = current_user.votes.new(value: params[:value])
    vote.post = Post.find(params[:post_id])
    if vote.save
      # render partial: 'vote_count' , locals: { post: vote.post }
    else
      # render partial: :errors, locals: { error: vote.errors.full_messages }
    end
    redirect_to post_path(vote.post)
  end

  def update
    vote = current_user.votes.where(id: params[:vote_id]).first
    if vote.update_attributes params[:vote]
      render partial: 'vote_count', locals: { post: vote.post }
    else
      # render partial: :errors, locals: { error: vote.errors.full_messages }
    end
  end

end