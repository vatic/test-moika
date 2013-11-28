class RemoveInnFromInvoice < ActiveRecord::Migration
  def change
    change_table :invoices do |t|
      t.remove :inn
    end

  end
end
