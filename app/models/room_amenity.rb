class RoomAmenity < ActiveRecord::Base
  belongs_to :room
  belongs_to :amenity

  validates :amenity_id, uniqueness: { scope: :room_id }
end
