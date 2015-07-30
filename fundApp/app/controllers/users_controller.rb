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

# ## not working?
#   def inc_fund
#     @users = User.all
#     @user = User.find(params[:id])
#     @user_item = ItemUser.all.where(user_id:@user, item_id:12).first
#     @user_item.increment!(:fund, by = 5)
#   end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :cc_no, :billing_address)
  end
end
