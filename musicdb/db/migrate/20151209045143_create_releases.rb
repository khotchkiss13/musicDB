class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.integer :record_label_id
      t.integer :group_id
      t.string :name
      t.datetime :date
      t.string :media_type
      t.integer :total_length
      t.integer :copies_sold
      t.integer :total_profit
      t.string :medium
      t.string :vertification

      t.timestamps null: false
    end
  end
end
