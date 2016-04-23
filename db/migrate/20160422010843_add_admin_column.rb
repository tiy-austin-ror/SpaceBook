class AddAdminColumn < ActiveRecord::Migration
  def up
    change_column :events, :start_time, :datetime
  end

  def down
    change_column :events, :start_time, :date
  end
end
