require File.join(File.dirname(__FILE__), '..', 'config', 'boot')
require File.join(File.dirname(__FILE__), '..', 'config', 'environment')

every(1.day, 'notifications.send', :at => '10:00') { WeeklyRideNotifier.send_weekly_ride_notification if(Time.now.wday == 3) }