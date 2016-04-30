class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.datetime :begins_at
      t.references :ride
      t.references :route
      t.timestamps
    end
  end

  def down
    drop_table :evnents
  end
end
