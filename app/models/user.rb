class User < ActiveRecord::Base
  include Clearance::User
  attr_accessor :password_confirmation

  attachment :profile_image #required for Refile (image upload)
  has_one :campus_user
  has_one :campus, through: :campus_user
  has_many :invites
  has_many :meetings, through: :invites, source: :event
  has_many :comments
  has_many :events
  belongs_to :company

  validates :username, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :phone_num, presence: true
  validates :admin, :inclusion => {:in => [true, false]}

  def campus_events
    self.campus.events
  end

  def full_name
    self.name
  end

  def finished_events
    self.events.where("start_time <= ?", Time.zone.now) ||
    self.meetings.where("start_time <= ?", Time.zone.now)
  end

  def upcoming_events
    self.events.where("start_time >= ?", Time.zone.now)
  end

  def upcoming_meetings
    self.meetings.where("start_time >= ?", Time.zone.now)
  end
end
