class AddRoutesSlugs < ActiveRecord::Migration[4.2]
  def up
    add_column :routes, :slug, :string
  end

  def down
    remove_column :routes, :slug
  end
end
