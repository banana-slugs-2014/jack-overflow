class UsersController < ActionController::Base
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:user])
  end

  def create
    @user = User.new(username: params[:user][:username])
    @user.password = params[:user][:password]
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update

  end

  def destroy

  end

end
