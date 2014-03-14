class UsersController < ActionController::Base
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = !params[:id].nil? ? User.find(params[:user]) : User.find(session[:user_id])
  end

  def create
    @user = User.new(username: params[:user][:username])
    @user.password = params[:user][:password]
    @user.save ? (redirect_to user_path(@user)) : (render :new)
  end

  def edit
    @user = User.find(params[:user])
  end

  def update
    @user = User.find params[:id]
    @user.username = params[:user][:username]
    @user.save ? (redirect_to user_path(@user)) : (render :edit)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

end
