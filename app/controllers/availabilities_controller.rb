class AvailabilitiesController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :find_property
  before_action :find_availability, only: [ :show, :edit, :update, :destroy ]

  def show
  end

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

  def edit
  end

  def update
    if @availability.update(availability_params)
      flash[:notice] = "Availability successfully updated."
      redirect_to property_path(@property)
    else
      flash[:error] = "Failed to edit availability."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @availability.destroy
    flash[:notice] = "Availability successfully destroyed."
    redirect_to property_path(@property)
  end

  private

  def find_availability
    @availability = @property.availabilities.find(params[:id])
  end

  def find_property
    @property = Property.find(params[:property_id])
  end

  def availability_params
    params.require(:availability).permit(:manager_name, :scheduled_date)
  end
end
