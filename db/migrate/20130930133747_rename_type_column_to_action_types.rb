class RenameTypeColumnToActionTypes < ActiveRecord::Migration
  def change
    change_table :action_types do |t|
      t.rename :type, :text
    end
  end
end
