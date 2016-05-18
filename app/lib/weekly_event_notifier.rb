class WeeklyEventNotifier
  def self.send_weekly_event_notification
    if event = Event.this_week
      event.send_notifications
    end
  end
end
