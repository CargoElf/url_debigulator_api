class Link < ApplicationRecord
  has_many :user_links
  has_many :users, through: :user_links
  has_one :short_url_list

  validates_presence_of   :original_url
  validates_uniqueness_of :original_url

  def set_short_url
    short_url_list = ShortUrlList.find_by_link_id(nil)
    short_url_list.update(link_id: id)
    update(short_url_list_id: short_url_list.id)
  end

  def short_url
    short_url_list.short_url
  end

  def return_url
    'localhost:3000/' + short_url
  end
end
