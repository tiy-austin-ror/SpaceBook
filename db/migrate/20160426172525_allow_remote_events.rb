class AllowRemoteEvents < ActiveRecord::Migration
  def change
    add_column :events, :allow_remote, :bool, default: false
  end
end
