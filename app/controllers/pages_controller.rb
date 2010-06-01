class PagesController < ApplicationController
  def index
    @this_week = Ride.find_this_weeks_ride
  end

  def guidelines
  end
  
  def about
  end
    
end
