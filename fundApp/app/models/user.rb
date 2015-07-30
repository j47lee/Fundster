class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true, presence: true
  # has_and_belongs_to_many :items
  # serialize :wish_list, Hash

  has_many :item_users
  has_many :items, through: :item_users

end
