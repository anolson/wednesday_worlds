desc "Send weekly notifications"
task :send_notifications => :environment do
  # `source bin/restore_data && restore_data`
  puts "Event this week: #{Event.this_week.present?}"

  if(Time.now.wday == 3)  # Send the weekly email/tweet on Wednesday.
    WeeklyEventNotifier.send_weekly_event_notification
  end
end
