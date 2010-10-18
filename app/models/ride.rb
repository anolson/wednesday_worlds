class Ride < ActiveRecord::Base
  has_many :routes
  
  def this_weeks_route
    routes.each do |route| 
      return route if(route.occurrence.occurs_this_week?)
    end
    return nil
  end
  
end
