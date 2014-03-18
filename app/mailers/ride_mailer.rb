class RideMailer < ActionMailer::Base
  include ApplicationHelper
  helper :application

  default :from => "WednesdayWorlds <hello@wednesdayworlds.org>"

  def weekly_ride_email(recipient, ride)
    @ride = ride

    mail(:to => recipient,
         :subject => "WednesdayWorlds - #{format_date(@ride.routes.this_week.occurrence.next_date)}")
  end
end
