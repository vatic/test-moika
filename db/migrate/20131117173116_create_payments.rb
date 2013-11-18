class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.boolean :confirmed, default: false
      t.boolean :verified, default: false
      t.boolean :failed, default: true
      t.integer :car_wash_id
      t.float :amount

      t.timestamps
    end
  end
end
