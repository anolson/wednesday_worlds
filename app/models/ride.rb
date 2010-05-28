class Ride < ActiveRecord::Base
  has_many :routes
  
  def self.find_this_weeks_ride
    Ride.joins(:routes).where(:routes => {:begins_at => Route.this_week}).first
  end
  
  def this_weeks_route
    routes.each do |route| 
      return route if(route.occurs_this_week?)
    end
  end
  
end
