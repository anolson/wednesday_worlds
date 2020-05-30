class RemoveCurrentlyActiveFromRides < ActiveRecord::Migration[4.2]
  def up
    remove_column :rides, :currently_active
  end

  def down
    add_column :rides, :currently_active, :boolean
  end
end
