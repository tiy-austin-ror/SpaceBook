class AddColToCampus < ActiveRecord::Migration
  def change
    add_column :campuses, :name, :string
  end
end
