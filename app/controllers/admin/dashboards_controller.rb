class Admin::DashboardsController < Admin::AdminController
  def show
    @rides = Ride.all
    @routes = Route.all
  end
end
