class AddOpenInviteColToEvents < ActiveRecord::Migration
  def change
    add_column :events, :open_invite, :bool, default: true
  end
end
