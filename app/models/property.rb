class Property < ApplicationRecord
  validates_presence_of :name, message: "can't be blank"
  validates_presence_of :address, message: "can't be blank"

  has_many :availabilities, dependent: :destroy
end
