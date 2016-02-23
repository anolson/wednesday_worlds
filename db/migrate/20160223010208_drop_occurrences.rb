class DropOccurrences < ActiveRecord::Migration
  def up
    drop_table :occurrences
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
