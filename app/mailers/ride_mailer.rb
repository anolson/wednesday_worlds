class RideMailer < ActionMailer::Base
  include ApplicationHelper
  helper :application

  default from: "WednesdayWorlds <hello@wednesdayworlds.org>"

  def weekly_ride_email(recipient, event)
    @event = event

    mail(to: recipient, subject: "WednesdayWorlds - #{format_date(@event.begins_at)}")
  end
end
