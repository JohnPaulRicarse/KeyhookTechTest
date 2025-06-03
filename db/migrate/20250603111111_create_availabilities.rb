class CreateAvailabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :availabilities do |t|
      t.string :manager_name
      t.datetime :scheduled_date
      t.belongs_to :property, foreign_key: true
      t.timestamps
    end
  end
end
