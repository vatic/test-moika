class CarWash < ActiveRecord::Base
  has_many :users
  has_many :actions
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  after_validation :geocode, if: "lat_and_lon_nil?"

  private
    def lat_and_lon_nil?
      self.lat.nil? && self.lon.nil?
    end
end
