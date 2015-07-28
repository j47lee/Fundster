class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You successfully logged in with #{@user.email}!"
      redirect_to root_path
    else
      flash[:notice] = "Sorry, you failed to log in with #{params[:email]}"
      render 'new'
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end

end
