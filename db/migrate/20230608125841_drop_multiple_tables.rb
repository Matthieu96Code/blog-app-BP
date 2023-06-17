class DropMultipleTables < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, column: :author_id_id
    remove_foreign_key :comments, column: :author_id_id
    remove_foreign_key :likes, column: :author_id_id

    drop_table :likes, if_exists: true
    drop_table :comments, if_exists: true
    drop_table :posts, if_exists: true
    drop_table :users, if_exists: true
  end
end