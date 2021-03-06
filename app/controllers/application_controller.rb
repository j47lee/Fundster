class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper_method :current_user
  # helper_method :percentage_complete

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
   !!current_user
  end

  def authorize
    unless logged_in?
      flash[:error] = "Please login to access this section."
      redirect_to new_session_path
    end
  end

end
