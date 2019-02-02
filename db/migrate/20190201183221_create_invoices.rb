class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :amount
      t.date :emission_date
      t.date :due_date
      t.references :billable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
