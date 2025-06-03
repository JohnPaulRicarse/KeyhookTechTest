class Booking < ApplicationRecord
  validates_presence_of :availability, message: "must exist"

  belongs_to :availability
end
