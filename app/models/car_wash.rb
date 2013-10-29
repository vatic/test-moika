class CarWash < ActiveRecord::Base
  has_many :users
  has_many :actions
  has_many :comments
  has_many :requests
  has_many :messages

  accepts_nested_attributes_for :actions
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  
  after_validation :geocode, if: "lat_and_lon_nil?"

  after_update :update_signals, if: :signal_changed?  

  def unread_requests_count
    self.requests.unread.count
  end

  def unread_messages_count
    self.messages.unread.count
  end
 
  def signal_human
    self.signal ? I18n.t('signal_open'):I18n.t('signal_close')
    
  end
  def update_signals
    logger.debug "vatagin_from update signal_changed:#{self.title}:#{self.signal_changed}"
  end

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

  def enable_blink
    self.blink = true
    self.save!
  end

  def disable_blink
    self.blink = false
    self.save!
  end

  private
    def lat_and_lon_nil?
      self.lat.nil? && self.lon.nil?
    end
end
