class Availability < ApplicationRecord
  validates_presence_of :manager_name, message: "can't be blank"
  validates_presence_of :scheduled_date, message: "can't be blank"
  validates_presence_of :property, message: "must exist"
  validate :scheduled_date_is_in_future, on: :create

  belongs_to :property
  has_many :bookings

  scope :future, -> { where('scheduled_date > ?', DateTime.now) }

  private

  def scheduled_date_is_in_future
    if scheduled_date < DateTime.now
      errors.add(:scheduled_date, "must be in the future.")
    end
  end
end
