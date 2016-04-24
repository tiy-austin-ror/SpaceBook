class UniqueTime < ActiveModel::Validator
  def validate(record)
    if record.good_time_range?
      record.errors[:base] << 'This event overlaps with another event already scheduled in this room.'
    end
  end
end

class Event < ActiveRecord::Base
  has_many :invites
  has_many :invitees, through: :invites, source: :user

  has_many :comments
  belongs_to :room, counter_cache: true
  belongs_to :user
  validates_with UniqueTime


  def formatted_start_time
    self.start_time
  end

  def formatted_event_duration
    self.duration
  end

  def campus
    self.room.campus
  end

  def is_private?
    self.private
  end

  def invite_type
    return "Open" if open_invite == true
    return "Closed"
  end

  def good_time_range?
    room.event_overlap?(self)
  end
end
