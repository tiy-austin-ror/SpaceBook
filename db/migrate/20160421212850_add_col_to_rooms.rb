class AddColToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :name, :string
    add_column :rooms, :location, :string
    add_column :rooms, :capacity, :integer
    add_column :rooms, :picture_url, :string
    add_column :rooms, :events_count, :integer
    add_column :rooms, :average_event_duration, :integer
    add_column :rooms, :average_attendance_count, :integer
    add_column :rooms, :average_capacity_use, :integer
  end
end
