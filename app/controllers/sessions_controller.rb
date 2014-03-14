class SessionsController < ActionController::Base


  def new
  end

  def create
    @user = User.find_by_username params[:session][:username]
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to users_path
  end

end
