class AddColsToCampus < ActiveRecord::Migration
  def change
    add_column :campuses, :city, :string
    add_column :campuses, :state, :string
    add_column :campuses, :zip, :string
    add_column :campuses, :picture_url, :string
  end
end
