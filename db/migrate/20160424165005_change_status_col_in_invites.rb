class ChangeStatusColInInvites < ActiveRecord::Migration
  def change
    change_column :invites, :status, :string, default: "Pending", null: false
  end
end
