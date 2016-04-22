class User < ActiveRecord::Base
  include Clearance::User
  attr_accessor :password_confirmation

  has_one :campus_user
  has_many :invites
  has_many :comments
  has_many :events

  validates :username, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :phone_num, presence: true
  validates :profile_pic, presence: true
  validates :admin, :inclusion => {:in => [true, false]}
end
