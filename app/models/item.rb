class Item < ActiveRecord::Base
  # has_and_belongs_to_many :users

  has_many :item_users
  has_many :users, through: :item_users
end
