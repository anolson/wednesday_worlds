class Admin::RidesController < Admin::AdminController
  def new
    @ride = Ride.new
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def create
    @ride = Ride.new(params[:ride])

    if(@ride.save)
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def update
    @ride = Ride.find(params[:id])

    if(@ride.update_attributes(params[:ride]))
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy

    redirect_to admin_dashboard_path
  end
end
