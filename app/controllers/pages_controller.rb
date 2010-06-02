class PagesController < ApplicationController
  def index
    @ride = Ride.find_by_currently_active(true)
  end

  def guidelines
  end
  
  def about
  end
    
end
