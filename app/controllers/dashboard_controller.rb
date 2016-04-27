class DashboardController < ApplicationController
<<<<<<< HEAD
  before_action :require_login

=======
>>>>>>> 1a56525f53e954f2cd36ca3747fb753745ce8962
  def home
    @user = current_user
    @user_pending_invites = @user.invites.where(status: Invite::PENDING).includes(:event)
    @events = @user.upcoming_events.order("start_time")
    @pending = @user.upcoming_meetings.order("start_time")
    @finished = @user.finished_events.order("start_time")
  end
end
