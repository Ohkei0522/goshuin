class AddNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :name, :string
    add_column :posts, :image, :string
  end
end
