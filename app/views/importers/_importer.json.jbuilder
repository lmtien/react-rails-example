json.extract! importer, :id, :company, :invoice_num, :invoice_date, :operation_date, :amount, :reporter, :notes, :status_id, :category, :operation_id, :created_at, :updated_at
json.url importer_url(importer, format: :json)
