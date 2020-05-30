class DropAdministrators < ActiveRecord::Migration[4.2]
  def up
    drop_table :administrators
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
