require "rails_helper"

RSpec.describe "Availability" do
  let!(:property) { create :property }
  context "valid" do
    it "creates an availability" do
      availability = Availability.new(
        manager_name: "ayyy lmao",
        scheduled_date: DateTime.now + 1.week,
        property_id: property.id
      )
      expect { availability.save! }.not_to raise_error
    end
  end

  context "not valid" do
    it "raises an error for missing manager name" do
      availability = Availability.new(
        scheduled_date: DateTime.now + 1.week,
        property_id: property.id
      )
      expect { availability.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(availability.errors.full_messages.to_sentence).to eq "Manager name can't be blank"
    end

    it "raises an error for missing schedule date" do
      availability = Availability.new(
        manager_name: "sample",
        property_id: property.id
      )
      expect { availability.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(availability.errors.full_messages.to_sentence).to eq "Scheduled date can't be blank"
    end

    it "raises an error for the missing property" do
      availability = Availability.new(
        manager_name: "sample",
        scheduled_date: DateTime.now + 1.week
      )
      expect { availability.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(availability.errors.full_messages.to_sentence).to eq "Property can't be blank and Property must exist"
    end

    it "raises an error for the invalid scheduled date" do
      availability = Availability.new(
        manager_name: "sample",
        scheduled_date: DateTime.now - 1.week,
        property_id: property.id
      )
      expect { availability.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(availability.errors.full_messages.to_sentence).to eq "Scheduled date must be in the future."
    end
  end
end
