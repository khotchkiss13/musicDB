class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :individual_id
      t.integer :group_id
      t.string :name
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
