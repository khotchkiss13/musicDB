class RemoveReleaseIdFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :release_id
  end
end
