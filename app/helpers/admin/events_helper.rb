module Admin::EventsHelper
  def link_to_new_event
    link_to 'Create new event', new_admin_ride_event_path(@ride)
  end
end
