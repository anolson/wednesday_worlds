require 'twitter_ride_notifier'

class WeeklyRideNotifier
  include 
  def self.send_weekly_ride_notification
    ride = Ride.find_by_currently_active(true)
    if(ride)
      twitter_ride_notifier = TwitterRideNotifier.new
      twitter_ride_notifier.send_notification(ride)
      
      # RideMailer.weekly_ride_email(ride).deliver
    end
  end
end