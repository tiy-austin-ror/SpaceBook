class Campus < ActiveRecord::Base
  has_many :campus_users
  has_many :rooms
  has_many :events, through: :rooms
  has_many :invite_codes
end
