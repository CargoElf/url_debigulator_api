class CreateShortUrlLists < ActiveRecord::Migration[6.1]
  def change
    create_table :short_url_lists do |t|
      t.string     :short_url
      t.references :link, foreign_key: true
    end
  end
end
