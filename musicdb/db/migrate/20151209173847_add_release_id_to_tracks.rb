class AddReleaseIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :release_id, :integer
  end
end
