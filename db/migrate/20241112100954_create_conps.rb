class CreateConps < ActiveRecord::Migration[6.1]
  def change
    create_table :conps do |t|

      t.timestamps
    end
  end
end
