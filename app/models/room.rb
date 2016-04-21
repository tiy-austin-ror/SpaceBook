class Room < ActiveRecord::Base
  has_many :room_amenities
  has_many :events
  belongs_to :campus
end
