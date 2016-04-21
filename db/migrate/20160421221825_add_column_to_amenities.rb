class AddColumnToAmenities < ActiveRecord::Migration
  def change
    add_column :amenities, :name, :string
  end
end
