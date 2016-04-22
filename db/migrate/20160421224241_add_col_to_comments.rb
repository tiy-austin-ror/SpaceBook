class AddColToComments < ActiveRecord::Migration
  def change
    add_column :comments, :body, :text, null: false
  end
end
