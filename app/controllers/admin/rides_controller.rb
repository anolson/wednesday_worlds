class Admin::RidesController < Admin::AdminController
  def index
    @rides = Ride.all
  end
  
  def new
    @ride = Ride.new
  end
  
  def create
    @ride = Ride.new(params[:ride])
    
    if(@ride.save)
      redirect_to admin_rides_url
    else
      render :action => :new
    end
  end
  
  def edit
    @ride = Ride.find(params[:id])
  end
  
  def update
    reset_currently_active_ride
    
    @ride = Ride.find(params[:id])
    
    if(@ride.update_attributes(params[:ride]))
      redirect_to admin_rides_path
    else
      render :action => :edit
    end
  end
  
  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy
    
    redirect_to admin_rides_url
  end
  
  
  private
    def reset_currently_active_ride
      Ride.update_all(:currently_active => false)
    end
  
end
