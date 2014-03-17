class VotesController < ApplicationController

  def create
      vote = User.find(session[:user_id]).votes.build(value: params[:value].to_i)
      post = Post.find(params[:post_id])
      post.votes << vote
      vote.save
      render partial: 'vote', locals: { post: vote.post }
  end

  def update
    vote = User.find(session[:user_id]).votes.where(id: params[:id],  post_id: params[:post_id] ).first
    vote.value = params[:value]
       vote.save
    render partial: 'vote', locals: { post: vote.post }
  end

end