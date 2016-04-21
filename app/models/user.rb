class User < ActiveRecord::Base
  has_many :campus_users
  has_many :invites
  has_many :comments
end
