class RoutesController < ApplicationController
  # GET /rides/1/routes
  # GET /rides/1/routes.xml
  def index
    @routes = Route.where(:ride_id => params[:ride_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @routes }
    end
  end

  # GET /rides/1/routes/1
  # GET /rides/1/routes/1.xml
  def show
    @route = Route.find(params[:id])
    
    pp @route

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @route }
    end
  end

end
