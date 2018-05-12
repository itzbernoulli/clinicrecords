json.extract! merchant, :id, :instagram, :facebook, :twitter, :website, :feature_image, :short_description, :long_description, :category_id, :user_id, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
