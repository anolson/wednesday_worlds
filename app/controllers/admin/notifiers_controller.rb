class Admin::NotifiersController < Admin::AdminController
  def index
    @ride = Ride.find(params[:ride_id])
    @notifiers = @ride.notifiers
  end
end
