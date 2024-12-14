class CreateTeras < ActiveRecord::Migration[6.1]
  def change
    create_table :teras do |t|
      t.string :post

      t.timestamps
    end
  end
end
