class CreateTweetItems < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_items do |t|
      t.references :tweet, foreign_key: true
      t.string :item

      t.timestamps
    end
  end
end
