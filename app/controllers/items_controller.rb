class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end


  def add_item_to_user
    @item = Item.find(params[:item])
    @user = current_user
    @user.items << @item
    @user.save
    redirect_to user_path(@user)
  end

end
