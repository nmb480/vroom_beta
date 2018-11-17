class CreateChannelStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_statistics do |t|
      t.references :channel, foreign_key: true
      t.integer :viewCount
      t.integer :subscriberCount
      t.integer :videoCount

      t.timestamps
    end
  end
end
