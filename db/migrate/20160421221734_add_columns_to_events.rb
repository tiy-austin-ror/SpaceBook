class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    add_column :events, :start_time, :date
    add_column :events, :duration, :integer
    add_reference :events, :user, index: true, foreign_key: true
    add_column :events, :agenda, :text
    add_column :events, :description, :text
    add_column :events, :private, :bool
  end
end
