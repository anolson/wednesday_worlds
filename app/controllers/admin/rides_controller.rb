class Admin::RidesController < ApplicationController
  def index
    @rides = Ride.all
  end
end
