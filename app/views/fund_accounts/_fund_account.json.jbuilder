json.extract! fund_account, :id, :entity, :account_type, :ifsc, :name, :bank_account, :account_number, :vpa_address, :active, :contact_id, :created_at, :updated_at
json.url fund_account_url(fund_account, format: :json)
