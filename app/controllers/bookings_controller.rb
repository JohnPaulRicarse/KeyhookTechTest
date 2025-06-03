class BookingsController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :find_availability
  before_action :find_property
  before_action :find_booking, except: [ :new, :create ]

  def new
    @booking = Booking.new
  end

  def create
    @booking = @availability.bookings.new(booking_params)
    if @booking.save
      flash[:notice] = "Successfully booked this timeslot."
      redirect_to property_availability_path(@property, @availability)
    else
      flash[:error] = "Failed to book timeslot."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      flash[:notice] = "Successfully updated the booking."
      redirect_to property_availability_path(@property, @availability)
    else
      flash[:error] = "Failed to update the booking."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    flash[:notice] = "Successfully removed the booking."
    redirect_to property_availability_path(@property, @availability)
  end

  private

  def find_availability
    @availability = Availability.find(params[:availability_id])
  end

  def find_property
    @property = @availability.property
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:potential_tenant_name)
  end
end
