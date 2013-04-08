module Admin::RidesHelper
  def link_to_new_ride
    link_to "Create new ride", new_admin_ride_path
  end
end
