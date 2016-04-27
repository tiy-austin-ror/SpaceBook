class Company < ActiveRecord::Base
  has_many :users
  has_many :campuses
  has_many :rooms, through: :campuses
  has_many :events, through: :campuses
end
