class AddIndexToMovie < ActiveRecord::Migration[5.2]
  def change
    add_index :movies, :videoId, unique: true
  end
end
