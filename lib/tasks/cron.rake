task :cron => :environment do
  if(Time.now.wday == 2)  # Send the weekly email on Tuesday.
    RideMailer.deliver_weekly_ride_email
  end
  
end
