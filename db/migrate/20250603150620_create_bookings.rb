class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.string :potential_tenant_name, null: false
      t.timestamps
    end
  end
end
