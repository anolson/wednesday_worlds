require 'twitter_ride_notifier'

class WeeklyRideNotifier
  def self.send_weekly_ride_notification
    ride = Ride.find_by_currently_active(true)
    if(ride)
      TwitterRideNotifier.send(ride)
      RideMailer.weekly_ride_email(ride).deliver
    end
  end
end