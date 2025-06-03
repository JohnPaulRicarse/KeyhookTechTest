require "rails_helper"

RSpec.describe "Property" do
  context "valid" do
    it "creates a property" do
      property = Property.new(
        name: "property name",
        address: "P. Sherman, 42 Wallaby Way, Sydney"
      )
      expect { property.save! }.not_to raise_error
    end
  end

  context "not valid" do
    it "raises an error for missing name" do
      property = Property.new(
        address: "P. Sherman, 42 Wallaby Way, Sydney"
      )
      expect { property.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(property.errors.full_messages.to_sentence).to eq "Name can't be blank"
    end

    it "raises an error for missing address" do
      property = Property.new(
        name: "Property Name"
      )
      expect { property.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(property.errors.full_messages.to_sentence).to eq "Address can't be blank"
    end
  end
end
