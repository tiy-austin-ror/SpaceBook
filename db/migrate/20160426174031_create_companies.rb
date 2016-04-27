class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name

      t.timestamps null: false
    end
    add_reference :users, :company, index: true, foreign_key: true
    add_reference :campuses, :company, index: true, foreign_key: true
  end
end
