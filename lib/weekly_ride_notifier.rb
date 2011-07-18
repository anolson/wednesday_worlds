require 'twitter_ride_notifier'

class WeeklyRideNotifier 
  def self.send_weekly_ride_notification
    ride = Ride.find_by_currently_active(true)
    if(ride && ride.this_weeks_route)
      #send the weekly ride tweet
      twitter_ride_notifier = TwitterRideNotifier.new
      twitter_ride_notifier.send_notification(ride)
      
      #send the weekly ride e-mail
      RideMailer.weekly_ride_email(ride).deliver
    end
  end
end