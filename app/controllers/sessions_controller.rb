class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_username params[:session][:username]
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:username] = @user.username.humanize
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
