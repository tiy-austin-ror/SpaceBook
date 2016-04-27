class UniqueTime < ActiveModel::Validator
  def validate(record)
    if record.good_time_range?
      record.errors[:base] << 'This event overlaps with another event already scheduled in this room.'
    end
  end
end

class FutureTime < ActiveModel::Validator
  def validate(record)
    if record.start_time < Time.zone.now
      record.errors[:base] << 'Events can only be in the future'
    end
  end
end

class Event < ActiveRecord::Base
  has_many :invites
  #TODO Probably wont need the has_many invitees
  has_many :invitees, through: :invites, source: :user

  has_many :comments
  belongs_to :room, counter_cache: true
  belongs_to :user
  validates_with UniqueTime
  validates_with FutureTime

  def formatted_start_time
    "#{start_time.strftime('%x')} at #{start_time.strftime('%r')}"
  end

  def end_time
    end_time = start_time+(duration*15).minutes
    "#{end_time.strftime('%r')}"
  end

  def duration_display
    display = duration*15
    "#{display} minutes"
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

  def get_physical_participation
    invites.where(status: "Accepted").count
  end

  def get_remote_participation
    invites.where(status: "Accepted[remote]").count
  end

  def get_total_participation
    invites.where(status: "Accepted").count + invites.where(status:"Accepted[remote]").count
  end

  def future_date?
    errors.add(:start_time, "can't be in the past") unless
      start_time.future?
  end
end
