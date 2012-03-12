class Admin::RoutesController < Admin::AdminController
  before_filter :find_ride

  def index; end
  
  def new
    @route = Route.new
  end
  
  def create
    @route = Route.new(params[:route])
    
    if(@route.save)
      redirect_to admin_ride_routes_url(@ride)
    else
      render :action => :new
    end
  end
  
  def edit
    @route = Route.find(params[:id])
  end
  
  def update    
    @route = Route.find(params[:id])
    
    if(@route.update_attributes(params[:route]))
      redirect_to admin_ride_routes_url(@ride)
    else
      render :action => :edit
    end
  end
    
  def destroy
     @route = Route.find(params[:id])
     @route.destroy

     redirect_to admin_ride_routes_url(@ride)
  end
  
  private
    def find_ride
      @ride = Ride.find(params[:ride_id])
    end
end
