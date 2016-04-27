class AddProfileImageToCampuses < ActiveRecord::Migration
  def change
    add_column :campuses, :profile_image_id, :string
  end
end
