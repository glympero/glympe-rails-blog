class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    #return this user if there is a user id stored in session
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #to convert anything to boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end


end
