class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :screen_name
      t.text :text
      t.string :icon
      t.string :userUrl
      t.string :tweetUrl
      t.datetime :datetime

      t.timestamps
    end
  end
end
