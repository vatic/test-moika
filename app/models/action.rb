class Action < ActiveRecord::Base
  belongs_to :car_wash, :class_name => "CarWash", :foreign_key => "car_wash_id"
  belongs_to :action_text, :class_name => "ActionText", :foreign_key => "action_text_id"
  belongs_to :action_type, :class_name => "ActionType", :foreign_key => "action_type_id" 

  delegate :text, to: :action_type, prefix: true
  delegate :text, to: :action_text

  scope :main, -> { includes(:action_type).where("action_types.text" => "main") }
  scope :bottom1, -> { includes(:action_type).where("action_types.text" => "bottom1") }
  scope :bottom2, -> { includes(:action_type).where("action_types.text" => "bottom2") }
  scope :left, -> { includes(:action_type).where("action_types.text" => "left") }

  def text=(str)
    action_text_object = ActionText.find_or_create_by(text: str)
    self.action_text_id = action_text_object.id
  end
end
