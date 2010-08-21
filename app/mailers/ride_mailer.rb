class RideMailer < ActionMailer::Base
  helper :application
  default :from => "WednesdayWorlds <hello@wednesdayworlds.org>"
  
  def weekly_ride_email(ride)
    @ride = ride
    
    mail(:to => "vt_cycling@listserv.vt.edu",
         :subject => "WednesdayWorlds - #{@ride.this_weeks_route.occurrence.this_weeks_date.strftime("%b %e")}")
  end
end
