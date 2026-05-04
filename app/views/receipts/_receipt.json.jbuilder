json.extract! receipt, :id, :property_id, :cash_balance_id, :date, :monthly_price, :status, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
