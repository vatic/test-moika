class CarWash < ActiveRecord::Base
  default_scope {order('id DESC').order('rating DESC')}
  after_create :create_empty_banners
  after_create :create_payment
  after_validation :geocode
  after_update :update_signals, if: :signal_changed?
  before_save :update_signal_type

  has_many :users
  has_many :actions
  has_many :comments
  has_many :requests
  has_many :messages
  has_many :banners
  has_many :payments
  has_many :invoices

  accepts_nested_attributes_for :actions
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  

  def activate!
    self.update(activated: true)
  end

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

  def update_signal_type
    signal_type = self.signal_type
    logger.debug "vatagin: #{signal_type}"
    case signal_type
    when /blink/
      logger.debug "vatagin: #{self.blink}"
      logger.debug "vatagin: #{self.videoned}"
      logger.debug "vatagin: #{self.action_on_map}"
      self.blink = true
      self.videoned = false
      self.action_on_map = false
      logger.debug "vatagin: #{self.blink}"
      logger.debug "vatagin: #{self.videoned}"
      logger.debug "vatagin: #{self.action_on_map}"
    when /action_on_map/
      logger.debug "vatagin: #{self.blink}"
      logger.debug "vatagin: #{self.videoned}"
      logger.debug "vatagin: #{self.action_on_map}"
      self.blink = false
      self.videoned = false
      self.action_on_map = true
      logger.debug "vatagin: #{self.blink}"
      logger.debug "vatagin: #{self.videoned}"
      logger.debug "vatagin: #{self.action_on_map}"
    when /videoned/
      logger.debug "vatagin: #{self.blink}"
      logger.debug "vatagin: #{self.videoned}"
      logger.debug "vatagin: #{self.action_on_map}"
      self.blink = false
      self.videoned = true
      self.action_on_map = false
      logger.debug "vatagin: #{self.blink}"
      logger.debug "vatagin: #{self.videoned}"
      logger.debug "vatagin: #{self.action_on_map}"
    else
      logger.debug "vatagin: #{self.blink}"
      logger.debug "vatagin: #{self.videoned}"
      logger.debug "vatagin: #{self.action_on_map}"
      self.blink = false
      self.videoned = false
      self.action_on_map = false
      logger.debug "vatagin: #{self.blink}"
      logger.debug "vatagin: #{self.videoned}"
      logger.debug "vatagin: #{self.action_on_map}"
    end
  end

  protected
    def create_empty_banners
      banners_data = [
        {place: "client_fat_top"},
        {place: "client_thin_bottom"},
        {place: "client_thin_top_1"},
        {place: "client_thin_top_2"},
        {place: "client_thin_top_3"},
        {place: "client_thin_top_4"}
      ]

      banners_data.each do |data| 
        self.banners << ClientBanner.new(data)
      end
      self.banners << ClientVideoBanner.new
    end
    def create_payment
      self.payments << Payment.new(amount: 6000.00)
    end

  private
    def lat_and_lon_nil?
      self.lat.nil? && self.lon.nil?
    end
end
