class EventMailer < ActionMailer::Base
  include ApplicationHelper
  helper :application

  default from: "WednesdayWorlds <hello@wednesdayworlds.org>"

  def event_notification(recipient, event)
    @event = event

    mail(to: recipient, subject: "WednesdayWorlds - #{format_date(@event.begins_at)}")
  end
end
