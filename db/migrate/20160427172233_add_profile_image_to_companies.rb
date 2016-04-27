class AddProfileImageToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :profile_image_id, :string
  end
end
