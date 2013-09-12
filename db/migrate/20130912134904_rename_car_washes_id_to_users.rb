class RenameCarWashesIdToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :car_washes_id, :car_wash_id
    end
  end
end
