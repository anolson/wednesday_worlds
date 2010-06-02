class CreateRides < ActiveRecord::Migration
  def self.up
    create_table :rides do |t|
      t.string :name
      t.string :location
      t.boolean :currently_active
      t.timestamps
    end
  end

  def self.down
    drop_table :rides
  end
end
