json.extract! expense, :id, :amount, :date, :description, :created_at, :updated_at
json.url expense_url(expense, format: :json)
