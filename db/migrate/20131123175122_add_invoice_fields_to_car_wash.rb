class AddInvoiceFieldsToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :official_title, :string
    add_column :car_washes, :u_address, :string
    add_column :car_washes, :inn, :string
  end
end
