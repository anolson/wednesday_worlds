class CreateOccurrences < ActiveRecord::Migration[4.2]
  def self.up
    create_table :occurrences do |t|
      t.boolean :recurs
      t.string :recurrence_type
      t.datetime :recurrence_ends_at
      t.datetime :begins_at
      t.references :route
      t.timestamps
    end
  end

  def self.down
    drop_table :recurrences
  end
end
