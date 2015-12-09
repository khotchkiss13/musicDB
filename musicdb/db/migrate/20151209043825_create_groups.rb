class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.datetime :formation_date
      t.datetime :disband_date

      t.timestamps null: false
    end
  end
end
