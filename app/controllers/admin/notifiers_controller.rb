class Admin::NotifiersController < Admin::AdminController
  before_filter :find_ride

  def new
    @notifier = Notifier.new
  end

  def create
    if(@notifier = @ride.notifiers.create(params[:notifier]))
      redirect_to admin_ride_url(@ride)
    else
      render :action => :new
    end
  end

  def edit
    @notifier = Notifier.find(params[:id])
  end

  def update
    @notifier = Notifier.find(params[:id])

    if(@notifier.update_attributes(params[:notifier]))
      redirect_to admin_ride_url(@ride)
    else
      render :action => :edit
    end
  end

  def destroy
    Notifier.destroy(params[:id])
    redirect_to admin_ride_url(@ride)
  end

  private

  def find_ride
    @ride = Ride.find(params[:ride_id])
  end
end
