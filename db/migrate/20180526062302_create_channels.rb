class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name, null: false
      t.string :channelId, null: false
      t.string :channelTitle
      t.string :thumbnail
      t.text :description
      t.datetime :publishedAt
      t.string :belongTo

      t.timestamps
    end
    add_index :channels, :channelId, unique: true
  end
end
