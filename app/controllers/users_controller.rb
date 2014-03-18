class UsersController < ApplicationController
  before_filter :protect_route, :except => [:show, :new, :create]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to(root_path)
      login @user
    else
      render(:new)
    end
  end

  def update
    current_user.username = params[:user][:username]
    # smae as create
    @user.save ? (redirect_to user_path(@user)) : (render :edit)
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end
end
