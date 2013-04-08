class CreateNotifiers < ActiveRecord::Migration
  def change
    create_table :notifiers do |t|
      t.boolean :enabled
      t.string :type
      t.string :recipient
      t.references :ride
      t.timestamps
    end
  end
end
