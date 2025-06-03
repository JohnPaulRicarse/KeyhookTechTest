require "rails_helper"

RSpec.describe "Booking" do
  let!(:property) { create :property }
  let!(:availability) { create :availability, property: property }

  context "valid" do
    it "creates a booking" do
      booking = Booking.new(
        potential_tenant_name: "Ten Ant",
        availability: availability
      )
      expect { booking.save! }.not_to raise_error
    end
  end

  context "not valid" do
    it "raises an error for missing tenant name" do
      booking = Booking.new(
        availability: availability
      )
      expect { booking.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(booking.errors.full_messages.to_sentence).to eq "Potential tenant name can't be blank"
    end

    it "raises an error if the availability is not bookable" do
      availability.update(scheduled_date: DateTime.now - 1.week)
      booking = Booking.new(
        potential_tenant_name: "Ten Ant",
        availability: availability
      )
      expect { booking.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(booking.errors.full_messages.to_sentence).to eq "Availability must be bookable."
    end
  end
end
