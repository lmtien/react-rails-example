class Importer < ApplicationRecord
  belongs_to :status
  belongs_to :operation

  def self.import(row)
    Importer.create! ({company: row['company']&.strip,
                        invoice_num: row['invoice_num']&.strip,
                        invoice_date: row['invoice_date']&.strip,
                        operation_date: row['operation_date']&.strip,
                        amount: row['amount']&.strip,
                        reporter: row['reporter']&.strip,
                        notes: row['notes']&.strip,
                        status_id: Status.find_or_create_by(name: row['status']&.strip).id,
                        category: row['category']&.strip&.downcase,
                        operation_id: Operation.find_or_create_by(name: row['operation']&.strip).id})
  end
end
