class RemoteInvite < ActiveModel::Validator
  def validate(record)
    if record.status == "Accepted[remote]" && record.event.allow_remote
      record.errors[:base] << 'This event does not allow remote attendance!'
    end
  end
end

class Invite < ActiveRecord::Base
  def self.confirmation
    ['Accepted', 'Rejected', 'Pending', 'Accepted[remote]']
  end

  belongs_to :user
  belongs_to :event
  validates_with RemoteInvite
  validates :user_id, presence: { message: "Invalid User Name" }
  validates :user_id, uniqueness: {
    scope: :event_id,
    message: "Already on Invite List"
  }

  def user_name
    user.name
  end

  def as_json(_ = nil)
    super(methods: [:user_name])
  end
end
