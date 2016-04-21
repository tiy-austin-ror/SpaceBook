class User < ActiveRecord::Base
  has_one :campus_user
  has_many :invites
  has_many :comments
  has_many :events
end
