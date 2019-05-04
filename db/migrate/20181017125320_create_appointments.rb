class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments, id: :uuid do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :date_of_birth
      t.string :appointment_date
      t.string :message
      t.references :disease, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
