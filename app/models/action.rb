class Action < ActiveRecord::Base
  belongs_to :car_wash, :class_name => "CarWash", :foreign_key => "car_wash_id"
  belongs_to :action_text, :class_name => "ActionText", :foreign_key => "action_text_id"
  belongs_to :action_type, :class_name => "ActionType", :foreign_key => "action_type_id" 

  scope :main, -> { includes(:action_type).where("action_types.text" => "main") }

end
