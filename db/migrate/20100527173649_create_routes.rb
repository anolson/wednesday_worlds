class CreateRoutes < ActiveRecord::Migration[4.2]
  def self.up
    create_table :routes do |t|
      t.string :name
      t.text :description
      t.string :map_url
      t.references :ride

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
