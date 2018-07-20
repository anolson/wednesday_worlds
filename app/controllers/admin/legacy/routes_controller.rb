class Admin::Legacy::RoutesController < Admin::Legacy::AdminController
  def new
    @route = Route.new
  end

  def create
    if @route = Route.create(route_params)
      redirect_to admin_legacy_dashboard_path
    else
      render :action => :new
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])

    if @route.update_attributes(route_params)
      redirect_to admin_legacy_dashboard_path
    else
      render :action => :edit
    end
  end

  def destroy
    Route.destroy(params[:id])
    redirect_to admin_legacy_dashboard_path
  end

  private

  def route_params
    params.require(:route).permit(:name, :description, :map_url)
  end
end
