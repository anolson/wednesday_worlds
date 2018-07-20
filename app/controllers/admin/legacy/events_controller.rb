class Admin::Legacy::EventsController < Admin::Legacy::AdminController
  before_filter :find_ride

  def new
    @event = Event.new
  end

  def create
    if @event = @ride.events.create(event_params)
      redirect_to admin_legacy_dashboard_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to admin_legacy_dashboard_path
    else
      render :edit
    end
  end

  def destroy
    Event.destroy(params[:id])
    redirect_to admin_legacy_dashboard_path
  end

  private

  def find_ride
    @ride = Ride.find(params[:ride_id])
  end

  def event_params
    params.require(:event).permit(:begins_at, :route_id)
  end
end
