class ChangeTypeOfServices < ActiveRecord::Migration
  def change
    change_table :car_washes do |t|
      t.change :services, :text
    end
  end
end
