class DropOccurrences < ActiveRecord::Migration[4.2]
  def up
    drop_table :occurrences
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
