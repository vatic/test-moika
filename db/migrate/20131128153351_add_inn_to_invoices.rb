class AddInnToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :inn, :string
  end
end
