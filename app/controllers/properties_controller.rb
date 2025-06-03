class PropertiesController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def index
    @properties = Property.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      flash[:notice] = "Property successfully created."
      redirect_to property_path(@property)
    else
      flash[:alert] = "Failed to create property."
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :description, :address)
  end
end
