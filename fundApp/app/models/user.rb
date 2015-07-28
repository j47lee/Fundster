class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true, presence: true
  has_and_belongs_to_many :items

end
