json.extract! icd, :id, :code, :title, :created_at, :updated_at
json.url icd_url(icd, format: :json)
