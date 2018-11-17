class CreateChannelHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_hashtags do |t|
      t.references :channel, foreign_key: true
      t.string :hashtag

      t.timestamps
    end
    add_index :channel_hashtags, [:channel_id, :hashtag], unique: true
  end
end
