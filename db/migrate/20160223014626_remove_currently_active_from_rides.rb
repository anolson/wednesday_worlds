class RemoveCurrentlyActiveFromRides < ActiveRecord::Migration
  def up
    remove_column :rides, :currently_active
  end

  def down
    add_column :rides, :currently_active, :boolean
  end
end
