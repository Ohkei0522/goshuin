class CreatTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
