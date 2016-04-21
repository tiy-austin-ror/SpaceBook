class Amenity < ActiveRecord::Base
  has_many :room_amenities
end
