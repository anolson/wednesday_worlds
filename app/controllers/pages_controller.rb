class PagesController < ApplicationController
  def index
    @rides = Ride.find(:all)
    @this_week = Route.find_this_weeks_route
  end

end
