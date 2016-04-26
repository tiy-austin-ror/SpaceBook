class CreateInviteCodes < ActiveRecord::Migration
  def change
    create_table :invite_codes do |t|
      t.references :campus, index: true, foreign_key: true
      t.string :hash_code

      t.timestamps null: false
    end
  end
end
