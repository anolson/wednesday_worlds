class WeeklyRideNotifier
  def self.send_weekly_ride_notification
    if event = Event.this_week
      event.send_notifications
    end
  end
end
