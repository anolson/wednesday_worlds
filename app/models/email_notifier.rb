class EmailNotifier < Notifier
  def send_notification
    RideMailer.weekly_ride_email(recipient, ride).deliver
  end
end
