json.extract! appointment, :id, :name, :phone, :email, :date_of_birth, :appointment_date, :message, :disease_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
