class ApplicationController < ActionController::Base
  protect_from_forgery

  def self.logged_in?
    !!session[:user_id]
  end

  def self.current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
