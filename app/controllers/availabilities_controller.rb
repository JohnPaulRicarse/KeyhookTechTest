class AvailabilitiesController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :find_property, only: [ :new, :create ]

  def new
    @availability = Availability.new
  end

  def create
    if @property.availabilities.create(availability_params)
      flash[:notice] = "Availability successfully created."
      redirect_to property_path(@property)
    else
      flash[:error] = "Failed to create Availability."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_property
    @property = Property.find(params[:property_id])
  end

  def availability_params
    params.require(:availability).permit(:manager_name, :scheduled_date)
  end
end
