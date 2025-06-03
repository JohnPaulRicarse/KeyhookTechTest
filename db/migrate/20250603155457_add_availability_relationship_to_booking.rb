class AddAvailabilityRelationshipToBooking < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookings, :availability, index: true
  end
end
