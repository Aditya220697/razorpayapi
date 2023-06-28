json.extract! payout, :id, :account_number, :amount, :currency, :mode, :purpose, :fund_account_id, :created_at, :updated_at
json.url payout_url(payout, format: :json)
