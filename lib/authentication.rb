module Authentication
  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def protect_route
    redirect_to root_path unless logged_in?
  end

  def login user
    session[:user_id] = user.id
  end
end
