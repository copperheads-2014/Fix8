class PropertiesController < ApplicationController
  #have user authentication code as a before block

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      # @user.properties << @property
      # redirect_to properties_path
    else
      render :new
    end
  end

  private

    def property_params
      params.require(:game).permit(:name, :address)
    end

end
