class CarWash < ActiveRecord::Base
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  after_validation :geocode
end
