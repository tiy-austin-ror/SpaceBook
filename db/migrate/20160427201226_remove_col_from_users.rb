class RemoveColFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_pic, :string
    remove_column :rooms, :picture_url, :string
    remove_column :campuses, :picture_url, :string
  end
end
