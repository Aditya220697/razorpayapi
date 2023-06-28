json.extract! contact, :id, :name, :contact, :email, :type, :reference_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
