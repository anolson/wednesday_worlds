class RidesController < ApplicationController
  # GET /rides
  # GET /rides.xml
  def index
    @rides = Ride.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rides }
    end
  end

  # GET /rides/1
  # GET /rides/1.xml
  def show
    @ride = Ride.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ride }
    end
  end
  
  # GET /rides/current
  # GET /rides/current.xml
  def current
    @ride = Ride.find_by_currently_active(true)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ride }
    end
  end

end
