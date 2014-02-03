class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.references :normal_user, index: true
      t.references :car_wash, index: true

      t.timestamps
    end
  end
end
