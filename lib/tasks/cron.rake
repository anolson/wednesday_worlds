require 'weekly_ride_notifier'

task :cron => :environment do
  if(Time.now.wday == 3)  # Send the weekly email on Wednesday.
    RideMailer.deliver_weekly_ride_email
    WeeklyRideNotification.send_weekly_ride_notification
  end
  
end
