class Campus < ActiveRecord::Base
  has_many :campus_users
  has_many :rooms
end
