class CreateActionTypes < ActiveRecord::Migration
  def change
    create_table :action_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
