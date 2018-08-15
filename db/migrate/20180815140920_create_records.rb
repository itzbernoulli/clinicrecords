class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :name
      t.string :years
      t.string :months
      t.string :gender
      t.string :address
      t.string :health_care_provider
      t.string :department
      t.string :complaints
      t.string :diagnosis
      t.string :treatment
      t.string :height
      t.string :weight
      t.string :temperature
      t.string :blood_pressure
      t.string :drugs_given
      t.boolean :front_desk_updated
      t.boolean :nurse_updated
      t.boolean :doctor_updated
      t.boolean :pharmarcist_updated
      t.string :front_desk_name
      t.string :nurse_name
      t.string :doctor_name
      t.string :pharmacist_name
      t.string :nurse_update_time
      t.string :doctor_update_time
      t.string :pharmacist_update_time

      t.timestamps
    end
  end
end
