class Link < ApplicationRecord
  has_many :user_links
  has_many :users, through: :user_links
  has_one :short_url_list
  has_one :short_url, through: :short_url_list

  validates_presence_of   :original_url
  validates_uniqueness_of :original_url
end
