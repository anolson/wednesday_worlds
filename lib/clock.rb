require 'config/boot'
require 'config/environment'
require 'weekly_ride_notifier'

every(1.day, 'notifications.send', :at => '10:15') { WeeklyRideNotifier.send_weekly_ride_notification if(Time.now.wday == 3) }