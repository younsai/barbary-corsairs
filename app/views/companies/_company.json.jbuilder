json.extract! company, :id, :company_name, :address, :phone_number, :logo, :created_at, :updated_at
json.url company_url(company, format: :json)
