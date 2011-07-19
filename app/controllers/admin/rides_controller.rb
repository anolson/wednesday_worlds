class Admin::RidesController < ApplicationController
  def index
    @rides = Ride.all
  end
  
  def edit
    @ride = Ride.find(params[:id])
  end
end
