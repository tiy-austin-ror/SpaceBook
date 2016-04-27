class AddProfileImageToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :profile_image_id, :string
  end
end
