class RemoveColumnFromCarWash < ActiveRecord::Migration
  def change
    change_table :car_washes do |t|
      t.remove :actions
    end
  end
end
