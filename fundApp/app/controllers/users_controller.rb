class UsersController < ApplicationController
  before_action :authorize, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

## not working, increment hash ##
  def fund
    @users = User.all
    @user = User.find(params[:id])
    @user.wish_list["Jordan Retro 20"]+=25
    @user.save
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :cc_no, :billing_address)
  end
end
