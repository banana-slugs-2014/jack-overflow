class UsersController < ApplicationController
  before_filter :grab_user, only: [:edit, :show]
  before_filter :get_user, only: [:update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(username: params[:user][:username])
    @user.password = params[:user][:password]
    @user.save ? (redirect_to root_path) : (render :new)
  end

  def edit
  end

  def update
    @user.username = params[:user][:username]
    @user.save ? (redirect_to user_path(@user)) : (render :edit)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def grab_user
    @user = !params[:id].nil? ? User.find(params[:user]) : User.find(session[:user_id])
  end

  def get_user
    @user = User.find(params[:id])
  end

end
