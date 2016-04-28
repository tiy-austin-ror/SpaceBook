class AddColorsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :primary_color, :string
    add_column :companies, :secondary_color, :string
    add_column :companies, :snippet, :text
  end
end
