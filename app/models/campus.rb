class Campus < ActiveRecord::Base
  has_many :campus_users
  has_many :rooms
  has_many :events, through: :rooms
  has_many :invite_codes
  belongs_to :company

  attachment :profile_image #required for Refile (image upload)

end
