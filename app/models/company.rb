class Company < ActiveRecord::Base
  has_many :users
  has_many :campuses

  attachment :profile_image #required for Refile (image upload)
  
end
