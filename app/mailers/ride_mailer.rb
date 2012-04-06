class RideMailer < ActionMailer::Base
  include ApplicationHelper
  helper :application
  
  default :from => "WednesdayWorlds <hello@wednesdayworlds.org>"
  
  def weekly_ride_email(ride)
    @ride = ride
    
    mail(:to => "wednesdayworlds@googlegroups.com",
         :subject => "WednesdayWorlds - #{format_date(@ride.routes.this_week.occurrence.next_date)}")
  end
end
