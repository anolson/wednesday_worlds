class PagesController < ApplicationController
  def index
    @this_week = Ride.find_this_weeks_ride
  end

end
