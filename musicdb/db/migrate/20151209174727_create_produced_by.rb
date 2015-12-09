class CreateProducedBy < ActiveRecord::Migration
  def change
    create_table :produced_by do |t|
      t.integer :individual_id
      t.integer :song_id
    end
  end
end
