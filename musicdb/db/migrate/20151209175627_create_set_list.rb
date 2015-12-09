class CreateSetList < ActiveRecord::Migration
  def change
    create_table :set_lists do |t|
      t.integer :show_id
      t.integer :track_id
    end
  end
end
