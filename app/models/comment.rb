class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :body, presence: true, length: { in: 2..500 }


  def created_time
    "#{created_at.strftime('%r')} on #{created_at.strftime('%x')}"
  end

  def user_name
    user.name
  end


  def as_json(_ = nil)
    super(methods: [:created_time, :user_name])
  end
end
