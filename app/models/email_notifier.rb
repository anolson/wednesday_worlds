class EmailNotifier < Notifier
  def send_notification(event)
    RideMailer.weekly_ride_email(recipient, event).deliver
  end
end
