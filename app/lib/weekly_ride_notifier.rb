class WeeklyRideNotifier 
  def self.send_weekly_ride_notification
    ride.send_notifications if ride = Ride.find_by_currently_active(true)
  end
end