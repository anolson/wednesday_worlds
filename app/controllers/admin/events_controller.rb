class Admin::EventsController < Admin::AdminController
  before_filter :find_ride

  def new
    @event = Event.new
  end

  def create
    if(@event = @ride.events.create(params[:event]))
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if(@event.update_attributes(params[:event]))
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  def destroy
    Event.destroy(params[:id])
    redirect_to admin_dashboard_path
  end

  private

  def find_ride
    @ride = Ride.find(params[:ride_id])
  end
end
