class User < ActiveRecord::Base
  include Clearance::User
  attr_accessor :password_confirmation

  has_one :campus_user
  has_one :campus, through: :campus_user
  has_many :invites
  has_many :comments
  has_many :events

  validates :username, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :phone_num, presence: true
  validates :admin, :inclusion => {:in => [true, false]}

  before_create :default_values
  def default_values
    if self.profile_pic.empty?
      self.profile_pic = 'https://cdn0.vox-cdn.com/thumbor/dUhFuohIxvh-F4v3EKsjY3XSWIU=/cdn0.vox-cdn.com/uploads/chorus_asset/file/3893454/win10_skype_320x320.0.gif'
    end
  end

  def campus_events
    self.campus.events
  end

  def full_name
    self.name
  end
end
