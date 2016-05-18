class EmailNotifier < Notifier
  def send_notification(event)
    EventMailer.event_notification(recipient, event).deliver
  end
end
