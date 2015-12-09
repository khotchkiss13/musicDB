class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :venue
      t.datetime :date
      t.integer :tickets_sold
      t.integer :total_profit

      t.timestamps null: false
    end
  end
end
