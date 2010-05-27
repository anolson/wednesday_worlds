class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :name
      t.text :description
      t.datetime :begins_at
      t.string :map_url
      t.references :ride

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
