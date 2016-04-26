class Invite < ActiveRecord::Base
  def self.confirmation
    ['Accepted', 'Rejected', 'Pending', 'Accepted[remote]']
  end

  belongs_to :user
  belongs_to :event

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
