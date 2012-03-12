require 'weekly_ride_notifier'

task :send_notifications => :environment do
  if(Time.now.wday == 3)  # Send the weekly email/tweet on Wednesday.
    WeeklyRideNotifier.send_weekly_ride_notification
  end
  WeeklyRideNotifier.send_weekly_ride_notification
end