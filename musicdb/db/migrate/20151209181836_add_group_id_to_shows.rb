class AddGroupIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :group_id, :integer
  end
end
