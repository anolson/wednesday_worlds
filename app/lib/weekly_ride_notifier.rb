class WeeklyRideNotifier
  def self.send_weekly_ride_notification
    if ride = Ride.find_by_currently_active(true)
      ride.send_notifications
    end
  end
end