class CreateRecurrences < ActiveRecord::Migration
  def self.up
    create_table :recurrences do |t|
      t.string :recurrence_type
      t.date :recurrence_begins_on
      t.date :recurrence_ends_on
      t.time :starts_at
      t.references :route
      t.timestamps
    end
  end

  def self.down
    drop_table :recurrences
  end
end
