class Availability < ApplicationRecord
  validates_presence_of :manager_name, message: "can't be blank"
  validates_presence_of :scheduled_date, message: "can't be blank"
  validates_presence_of :property, message: "must exist"

  belongs_to :property
end
