class UpdateAvailabilitiesNameAndDateToBeRequired < ActiveRecord::Migration[8.0]
  def change
    change_column_null :availabilities, :manager_name, false
    change_column_null :availabilities, :scheduled_date, false
  end
end
