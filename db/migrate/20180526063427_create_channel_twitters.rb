class CreateChannelTwitters < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_twitters do |t|
      t.references :channel, foreign_key: true
      t.string :screenName

      t.timestamps
    end
    add_index :channel_twitters, [:channel_id, :screenName], unique: true
  end
end
