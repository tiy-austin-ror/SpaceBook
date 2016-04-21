class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :room, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
