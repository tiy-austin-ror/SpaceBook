class Campus < ActiveRecord::Base
  has_many :campus_users
  has_many :rooms
  has_many :events, through: :rooms
  has_many :invite_codes
  belongs_to :company

  def public_events
    events.where(params[public: true]).includes(:room, :user)
  end

  def all_events
    events.includes(:room, :user)
  end
end
