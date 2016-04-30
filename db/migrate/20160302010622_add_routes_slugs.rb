class AddRoutesSlugs < ActiveRecord::Migration
  def up
    add_column :routes, :slug, :string
  end

  def down
    remove_column :routes, :slug
  end
end
