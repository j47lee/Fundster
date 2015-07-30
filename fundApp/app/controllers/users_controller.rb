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
      redirect_to items_path
    else
      render 'new'
    end
  end

# ## FUND OTHER USER'S ITEM (not working!!!!!)
#   def inc_fund
#     @users = User.all
#     @user = User.find(params[:id])
#     @user_item = ItemUser.all.where(user_id:@user, item_id:12).first
#     @user_item.increment!(:fund, by = 5)
#   end

## DELETES CURRENT USER'S ITEM
  def remove_item
    @user = User.find(params[:id])
    @item = Item.find(params[:item_id])
    # @item.destroy
    ItemUser.all.where(user_id:@user,item_id:@item).first.destroy
    flash[:notice] = "successfully removed shoe"
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :cc_no, :billing_address)
  end
end
