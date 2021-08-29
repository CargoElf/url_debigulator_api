class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :original_url, null: false, index: { unique: true }
      t.references :short_url_list, foreign: true

      t.timestamps
    end
  end
end
