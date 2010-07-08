task :cron => :environment do
  RideMailer.deliver_weekly_ride_email
end
