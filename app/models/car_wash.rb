class CarWash < ActiveRecord::Base
  has_many :users
  has_many :actions
  accepts_nested_attributes_for :actions
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  after_validation :geocode, if: "lat_and_lon_nil?"


  def main_action
     actions.includes(:action_type).where("action_types.text" => "main").first
  end

  def main_action_text
    main_action.action_text.text unless main_action.nil?
  end

  def action_by_type(type)
     actions.includes(:action_type).where("action_types.text" => type).first
  end
  def actiontext_by_type(type)
    action_by_type(type).action_text.text unless action_by_type(type).nil?
  end

  private
    def lat_and_lon_nil?
      self.lat.nil? && self.lon.nil?
    end
end
