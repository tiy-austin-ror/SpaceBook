class AddColumnsToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :status, :string
  end
end
