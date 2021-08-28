class User < ApplicationRecord
  has_secure_password

  has_many :user_links
  has_many :links, through: :user_links

  validates_presence_of   :username, :email
  validates_uniqueness_of :username, :email
end
