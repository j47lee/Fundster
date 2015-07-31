class RemoveWishListFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :wish_list
  end
end
