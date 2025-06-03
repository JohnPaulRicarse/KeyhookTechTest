# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'ffaker'

15.times do
  street_address = FFaker::Address.street_address
  property = Property.create(
    name: street_address,
    description: FFaker::Book.description,
    address: "#{street_address}, #{FFaker::Address.neighborhood}, #{FFaker::Address.city}"
  )

  15.times do
    property.availabilities.create(
      manager_name: FFaker::Name.name,
      scheduled_date: FFaker::Time.between(DateTime.now, (DateTime.now + 1.week))
    )
  end
end
