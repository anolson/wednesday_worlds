class Admin::Legacy::DashboardsController < Admin::Legacy::AdminController
  def show
    @rides = Ride.all
    @routes = Route.all
  end
end
