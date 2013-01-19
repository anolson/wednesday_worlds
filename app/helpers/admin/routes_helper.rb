module Admin::RoutesHelper
  def link_to_new_route
    link_to 'Create new route', new_admin_ride_route_path(@ride)
  end
end
