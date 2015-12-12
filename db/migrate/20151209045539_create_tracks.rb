class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :track_number
      t.integer :song_id

      t.timestamps null: false
    end
  end
end
