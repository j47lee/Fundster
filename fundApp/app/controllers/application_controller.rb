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
      flash[:error] = "You must be logged in to access this section (application_controller.rb)"
      redirect_to new_session_path
    end
  end

  # def percentage_complete
  #   @user = User.find(params[:id])
  #   @item = Item.find(params[:item_id])
  #   funded = ItemUser.all.where(user_id:@user,item_id:@item).first.fund
  #   price = Item.find(@item).price
  #   percentage = funded/price
  #   return "width:#{percentage}%"
  # end



end
