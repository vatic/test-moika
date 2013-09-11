class CreateCarWashes < ActiveRecord::Migration
  def change
    create_table :car_washes do |t|
      t.string :title
      t.string :address
      t.float :lat
      t.float :lon
      t.string :contacts
      t.string :services
      t.string :price
      t.integer :zones_count
      t.string :actions
      t.string :video_url1
      t.string :video_url2
      t.boolean :signal

      t.timestamps
    end
  end
end
