class CreateMultipleTables < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_conter
      t.integer :likes_counter
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    create_table :comments do |t|
      t.text :text
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    create_table :likes do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end