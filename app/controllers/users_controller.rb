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
      session[:user_id]=@user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

## FUND ITEM
  def fund_item
    @user = User.find(params[:id])
    @item = Item.find(params[:item_id])
    @user_item = ItemUser.all.where(user_id:@user, item_id:@item).first
    @user_item.increment!(:fund, by = 15)
    flash[:notice] = "Thanks! Item successfully funded."
    redirect_to user_path
  end

## DELETES CURRENT USER'S ITEM
  def remove_item
    @user = User.find(params[:id])
    @item = Item.find(params[:item_id])
    # @item.destroy
    ItemUser.all.where(user_id:@user,item_id:@item).first.destroy
    flash[:notice] = "You've successfully removed the item."
    redirect_to user_path
  end

## PERCENTAGE COMPLETE FOR USERS ITEM
  # def percentage_complete
  #   @user = User.find(params[:id])
  #   @item = Item.find(params[:item_id])
  #   funded = ItemUser.all.where(user_id:@user,item_id:@item).first.fund
  #   price = Item.find(@item).price
  #   percentage = funded/price
  #   return "width:#{percentage}%"
  # end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :cc_no, :billing_address)
  end
end
