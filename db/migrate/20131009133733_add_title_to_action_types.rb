class AddTitleToActionTypes < ActiveRecord::Migration
  def change
    add_column :action_types, :title, :string
  end
end
