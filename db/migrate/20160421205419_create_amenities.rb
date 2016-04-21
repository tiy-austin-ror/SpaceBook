class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|

      t.timestamps null: false
    end
  end
end
