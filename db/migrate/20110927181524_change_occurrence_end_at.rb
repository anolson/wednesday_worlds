class ChangeOccurrenceEndAt < ActiveRecord::Migration[4.2]
  def self.up
    change_table :occurrences do |t|
      t.change :recurrence_ends_at, :date
    end
  end

  def self.down
    change_table :occurrences do |t|
      t.change :recurrence_ends_at, :datetime
    end
  end
end
