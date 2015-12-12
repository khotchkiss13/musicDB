class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :name
      t.datetime :birth_date
      t.string :primary_instrument
      t.string :secondary_instrument
      t.string :vocals

      t.timestamps null: false
    end
  end
end
