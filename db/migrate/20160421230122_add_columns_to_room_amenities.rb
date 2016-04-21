class AddColumnsToRoomAmenities < ActiveRecord::Migration
  def change
    add_column :room_amenities, :room_id, :integer
    add_column :room_amenities, :amenity_id, :integer
  end
end
