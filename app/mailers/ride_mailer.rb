class RideMailer < ActionMailer::Base
  default :from => "WednesdayWorlds <hello@wednesdayworlds.org>"
  
  def weekly_ride_email
    @ride = Ride.find_by_currently_active(true)
    
    mail(:to => "anolson@gmail.com",
         :subject => "WednesdayWorlds - #{@ride.this_weeks_route.occurrence.this_weeks_date.strftime("%b %e")}")
  end
end
