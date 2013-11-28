class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :car_wash_id, index: true
      t.string :address
      t.string :title
      t.integer :inn
      t.string :phone

      t.timestamps
    end
  end
end
