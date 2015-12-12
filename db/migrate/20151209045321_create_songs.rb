class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :release_id
      t.string :name
      t.string :genre
      t.integer :length
      t.integer :bpm
      t.string :medium

      t.timestamps null: false
    end
  end
end
