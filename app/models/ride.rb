class Ride < ActiveRecord::Base
  has_many :routes
  
  def self.find_this_weeks_ride
    Ride.find(:all).each do |ride| 
      if(!ride.this_weeks_route.nil?)
        return ride
      end
    end
  end
  
  def this_weeks_route
    routes.each do |route| 
      return route if(route.recurrence.occurs_this_week?)
    end
  end
  
end
