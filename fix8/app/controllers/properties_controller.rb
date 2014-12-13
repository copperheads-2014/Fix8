class PropertiesController < ApplicationController
  #have user authentication code as a before block

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.owner_id = @user.id
    if @property.save
      redirect_to new_job_path
    else
      render :new
    end
  end

  private

    def property_params
      params.require(:property).permit(:name, :address)
    end

end
