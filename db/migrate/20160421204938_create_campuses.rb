class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|

      t.timestamps null: false
    end
  end
end
