class SessionsController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # flash[:notice] = "You successfully logged in with #{user.email}!"
      redirect_to root_path, notice: "You've logged in! #{user.email} (SessionsController)"
      # redirect_to users_path(params[:id])
    else
      flash.now.alert = "Sorry, you failed to log in with #{params[:email]} (SessionsController)"
      render 'new'
    end
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url, notice: "You have logged out (SessionsController)"
  end
end
