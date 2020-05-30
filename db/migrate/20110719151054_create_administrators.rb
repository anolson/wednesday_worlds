class CreateAdministrators < ActiveRecord::Migration[4.2]
  def self.up
    create_table :administrators do |t|
      t.string :name
      t.string :twitter_screen_name
      t.timestamps
    end
  end

  def self.down
    drop_table :administrators
  end
end
