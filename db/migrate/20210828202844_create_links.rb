class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :original_url, null: false, unique: true

      t.timestamps
    end
  end
end
