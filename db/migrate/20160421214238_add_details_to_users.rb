class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, null: false
    add_column :users, :username, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :email, :string, null: false
    add_column :users, :phone_num, :string, null: false
    add_column :users, :profile_pic, :string
  end
end
