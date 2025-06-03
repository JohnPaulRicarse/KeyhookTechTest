class Booking < ApplicationRecord
  validates_presence_of :availability, message: "must exist"
  validate :availability_is_bookable, on: :create

  belongs_to :availability

  private

  def availability_is_bookable
    if !availability.bookable?
      errors.add(:availability, "must be bookable.")
    end
  end
end
