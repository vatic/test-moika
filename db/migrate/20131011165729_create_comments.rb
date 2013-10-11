class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.references :car_wash
      t.text :text

      t.timestamps
    end
  end
end
