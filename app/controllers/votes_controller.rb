class VotesController < ApplicationController

  def create
      vote = User.find(session[:user_id]).votes.build(value: params[:value].to_i)
      post = Post.find(params[:post_id])
      post.votes << vote
      vote.save
      render partial: 'vote', locals: { post: vote.post }
  end

  def update
    p "YOU DONT BELIEVE IN MAGIC"
    #allow change value of that user's vote fo that question
  #   vote = User.find(session[:user_id]).votes.where(id: params[:id],  post_id: params[:post_id] ).first
  #   if vote.value = params[:value]
  #     vote.save
  #     render partial: 'vote', locals: { post: vote.post }
  #   elsif new_vote = User.find(session[:user_id]).votes.build(value: params[:value].to_i, post_id: params[:post_id])
  #     render partial: 'vote', locals: { post: new_vote.post }
  #   end
  redirect_to '/'
  end

end