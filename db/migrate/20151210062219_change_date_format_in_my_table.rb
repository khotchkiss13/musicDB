class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def up
  	change_column :groups, :formation_date, :date
  	change_column :groups, :disband_date, :date
  	change_column :individuals, :birth_date, :date
  	change_column :members, :start_date, :date
  	change_column :members, :end_date, :date
  	change_column :record_labels, :date_founded, :date
  	change_column :record_labels, :date_dissolved, :date
  	change_column :releases, :date, :date
  	change_column :shows, :date, :date
  end

  def down
  	change_column :groups, :formation_date, :datetime
  	change_column :groups, :disband_date, :datetime
  	change_column :individuals, :birth_date, :datetime
  	change_column :members, :start_date, :datetime
  	change_column :members, :end_date, :datetime
  	change_column :record_labels, :date_founded, :datetime
  	change_column :record_labels, :date_dissolved, :datetime
  	change_column :releases, :date, :datetime
  	change_column :shows, :date, :datetime
  end

end
