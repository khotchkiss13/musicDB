class CreateRecordLabels < ActiveRecord::Migration
  def change
    create_table :record_labels do |t|
      t.string :name
      t.string :founder
      t.string :location
      t.string :ceo
      t.datetime :date_founded
      t.datetime :date_dissolved

      t.timestamps null: false
    end
  end
end
