class SessionsController < ActionController::Base


  def new
  end

  def create
    @user = User.find_by_username params[:session][:username]
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
