class PagesController < ApplicationController
  def index
    @ride = current_ride
  end

  private

  def current_ride
    Ride.active.first
  end
end
