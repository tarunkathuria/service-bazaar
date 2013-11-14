class ServicesController < ApplicationController
  def new    
    # render new.html.erb
  end

  def create
    # @service = Service.new(create_service_params)
    @service = current_user.services.build(create_service_params)
    if @service.save
      flash[:service_created] = "Service successfully created!"
      redirect_to '/'
    else
      redirect_to '/contact'
    end
  end

  def show
    serv_id = request.original_url.split("/").last
    @service = Service.find(serv_id)
  end

  private

  def create_service_params
    params.require(:service).permit(:title, :description, :visibility)
  end
end
