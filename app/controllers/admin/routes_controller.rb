class Admin::RoutesController < Admin::AdminController
  def new
    @route = Route.new
  end

  def create
    if @route = Route.create(params[:route])
      redirect_to admin_dashboard_path
    else
      render :action => :new
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])

    if @route.update_attributes(params[:route])
      redirect_to admin_dashboard_path
    else
      render :action => :edit
    end
  end

  def destroy
    Route.destroy(params[:id])
    redirect_to admin_dashboard_path
  end
end
