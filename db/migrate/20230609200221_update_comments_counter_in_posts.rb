class UpdateCommentsCounterInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :comments_conter, :comments_counter
  end
end
