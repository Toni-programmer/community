json.extract! expense, :id, :cash_balance_id, :supplier_id, :incidence_id, :amount, :date, :status, :created_at, :updated_at
json.url expense_url(expense, format: :json)
