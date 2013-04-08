module Admin::NotifiersHelper
  def link_to_new_notifier
    link_to 'Create new notification', new_admin_ride_notifier_path(@ride)
  end
end
