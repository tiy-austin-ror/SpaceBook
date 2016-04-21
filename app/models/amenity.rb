class Amenity < ActiveRecord::Base
  has_many :room_amenities

  validates :name, presence: true
end
