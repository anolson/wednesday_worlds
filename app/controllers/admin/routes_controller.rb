class Admin::RoutesController < Admin::AdminController
  before_filter :find_ride

  def new
    @route = Route.new
    @route.build_occurrence
  end

  def create
    if(@route = @ride.routes.create(params[:route]))
      redirect_to admin_ride_url(@ride)
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
      redirect_to admin_ride_url(@ride)
    else
      render :action => :edit
    end
  end

  def destroy
    Route.destroy(params[:id])
    redirect_to admin_ride_url(@ride)
  end

  private
  def find_ride
    @ride = Ride.find(params[:ride_id])
  end
end
