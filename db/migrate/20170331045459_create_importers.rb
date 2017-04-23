class CreateImporters < ActiveRecord::Migration[5.0]
  def change
    create_table :importers do |t|
      t.string :company
      t.string :invoice_num
      t.date :invoice_date
      t.date :operation_date
      t.float :amount
      t.string :reporter
      t.string :notes
      t.references :status, foreign_key: true
      t.string :category
      t.references :operation, foreign_key: true

      t.timestamps
    end
  end
end
