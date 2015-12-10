class Change < ActiveRecord::Migration
  def change
  	rename_column :releases, :vertification, :certification
  end
end
