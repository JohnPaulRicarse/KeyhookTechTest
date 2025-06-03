class BookingsController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :find_availability
  before_action :find_property

  def new
    @booking = Booking.new
  end

  def create
    if @availability.bookings.create(booking_params)
      flash[:notice] = "Successfully booked this timeslot."
      redirect_to property_availability_path(@property, @availability)
    else
      flash[:error] = "Failed to book timeslot."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_availability
    @availability = Availability.find(params[:availability_id])
  end

  def find_property
    @property = @availability.property
  end

  def booking_params
    params.require(:booking).permit(:potential_tenant_name)
  end
end
