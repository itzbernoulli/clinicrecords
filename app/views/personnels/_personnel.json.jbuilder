json.extract! personnel, :id, :first_name, :last_name, :phone_number, :title, :email, :created_at, :updated_at
json.url personnel_url(personnel, format: :json)
