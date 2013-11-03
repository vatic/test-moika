class Banner < ActiveRecord::Base
  mount_uploader :file, BannerUploader

  default_scope {order(place: :asc)}

  def self.left
    Banner.where("place ilike 'left%'").order(:place)
  end

  def self.top
    Banner.where("place ilike 'top%'")
  end

  def self.bottom
    Banner.where("place ilike 'bottom%'")
  end

  def self.request
    Banner.where("place ilike 'request%'")
  end
  
  def self.comment
    Banner.where("place ilike 'comment%'")
  end
  
  def left?
     !(/left_/ =~ self.place).nil?
  end

  def top?
     !(/top_/ =~ self.place).nil?
  end

  def bottom?
     !(/bottom_/ =~ self.place).nil?
  end

  def left_thin_short?
    !(/left_[24]/ =~ self.place).nil?
  end

  def left_thin_long?
    !(/left_[135]/ =~ self.place).nil?
  end
end
