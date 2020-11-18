json.extract! customer, :id, :forename, :surname, :phonenumber, :created_at, :updated_at
json.url customer_url(customer, format: :json)
