class CreateRecurrences < ActiveRecord::Migration
  def self.up
    create_table :recurrences do |t|
      t.string :type
      t.datetime :begins_at
      t.datetime :ends_at
      t.references :route
      t.timestamps
    end
  end

  def self.down
    drop_table :recurrences
  end
end
