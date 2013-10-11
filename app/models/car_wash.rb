class CarWash < ActiveRecord::Base
  has_many :users
  has_many :actions
  has_many :comments
  accepts_nested_attributes_for :actions
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  after_validation :geocode, if: "lat_and_lon_nil?"


  def main_action
     actions.includes(:action_type).where("action_types.text" => "main").first
  end

  def main_action_text
    main_action.try(:action_text).try(:text)
  end

  def actions_by_type(type)
     actions.includes(:action_type).where("action_types.text" => type.to_s)
  end
  def actiontext_by_type(type)
    actions_by_type(type).try(:action_text).first.try(:text)
  end

  private
    def lat_and_lon_nil?
      self.lat.nil? && self.lon.nil?
    end
end
