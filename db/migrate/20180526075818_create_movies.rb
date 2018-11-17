class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.references :channel, foreign_key: true
      t.string :videoId
      t.string :title
      t.string :thumbnail
      t.string :publishedAt

      t.timestamps
    end
  end
end
