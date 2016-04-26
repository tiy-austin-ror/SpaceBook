class Invite < ActiveRecord::Base
  def self.confirmation
    ['Accepted', 'Rejected', 'Pending']
  end

  belongs_to :user
  belongs_to :event

  validates :user_id, presence: { message: "Invalid User Name" }
  validates :user_id, uniqueness: {
    scope: :event_id,
    message: "Already on Invite List"
  }
end
