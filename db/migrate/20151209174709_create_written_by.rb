class CreateWrittenBy < ActiveRecord::Migration
  def change
    create_table :written_by do |t|
      t.integer :individual_id
      t.integer :song_id
    end
  end
end
