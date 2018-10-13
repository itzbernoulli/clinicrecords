class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :name
      t.date   :dob
      t.string :gender
      t.string :address
      t.string :health_care_provider
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
      t.datetime :nurse_update_time
      t.datetime :doctor_update_time
      t.datetime :pharmacist_update_time

      t.timestamps
    end
  end
end
