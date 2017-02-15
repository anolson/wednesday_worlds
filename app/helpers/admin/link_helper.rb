module Admin::LinkHelper
  def link_to_new_event
    link_to 'Create new event', new_admin_ride_event_path(@ride)
  end

  def link_to_new_notifier
    link_to 'Create new notifier', new_admin_ride_notifier_path(@ride)
  end

  def link_to_new_ride
    link_to "Create new ride", new_admin_ride_path
  end

  def link_to_new_route
    link_to 'Create new route', new_admin_route_path
  end
end
