task :cron => :environment do
  # if(Time.now.wday == 3)  # Send the weekly email on Wednesday.
  #   RideMailer.deliver_weekly_ride_email
  # end
  RideMailer.deliver_weekly_ride_email
end
