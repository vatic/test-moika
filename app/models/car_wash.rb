class CarWash < ActiveRecord::Base
  has_many :users
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  after_validation :geocode
end
