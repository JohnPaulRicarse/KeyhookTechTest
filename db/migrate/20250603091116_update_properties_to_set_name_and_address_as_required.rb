class UpdatePropertiesToSetNameAndAddressAsRequired < ActiveRecord::Migration[8.0]
  def change
    change_column_null :properties, :name, false
    change_column_null :properties, :address, false
  end
end
