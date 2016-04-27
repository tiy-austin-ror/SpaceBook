class Company < ActiveRecord::Base
  has_many :users
  has_many :campuses


  attachment :profile_image #required for Refile (image upload)


  has_many :rooms, through: :campuses
  has_many :events, through: :campuses

end
