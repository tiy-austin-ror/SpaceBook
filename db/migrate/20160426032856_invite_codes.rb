class InviteCodes < ActiveRecord::Migration
  def change
    add_column :invite_codes, campus
  end
end
