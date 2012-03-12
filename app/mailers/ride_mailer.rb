class RideMailer < ActionMailer::Base
  include ApplicationHelper
  helper :application
  
  default :from => "WednesdayWorlds <hello@wednesdayworlds.org>"
  
  def weekly_ride_email(ride)
    @ride = ride
    
    mail(:to => "anolson@gmail.com,
         :subject => "WednesdayWorlds - #{format_date(@ride.this_weeks_route.occurrence.this_weeks_date)}")
  end
end
