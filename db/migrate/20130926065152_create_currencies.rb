class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.decimal :value, precision: 8, scale: 2
      t.datetime :date

      t.timestamps
    end
  end
end
