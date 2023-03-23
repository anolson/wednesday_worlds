class Admin::NotifiersController < Admin::AdminController
  before_action :find_ride

  def new
    @notifier = Notifier.new
  end

  def create
    @notifier = @ride.notifiers.new(notifier_params)

    if @notifier.valid?
      @notifier.save
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

    if @notifier.update(notifier_params)
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

  def notifier_params
    params.require(:notifier).permit(:enabled, :type, :recipient)
  end
end
