class RenameTweetIdToPostIdInComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :tweet_id, :post_id
    change_column_null :comments, :post_id, false # `NULL` 制約を削除し、`NOT NULL` 制約を追加
    add_foreign_key :comments, :posts, column: :post_id 
  end
end
