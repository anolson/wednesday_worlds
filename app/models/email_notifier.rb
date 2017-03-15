class EmailNotifier < Notifier
  def send_notification(event)
    return unless enabled?

    EventMailer.event_notification(recipient, event).deliver
  end
end
