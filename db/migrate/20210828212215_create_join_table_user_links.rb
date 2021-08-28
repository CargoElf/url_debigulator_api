class CreateJoinTableUserLinks < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :links, table_name: :user_links do |t|
      t.index [:user_id, :link_id]
      t.index [:link_id, :user_id]
    end
  end
end
