class DashboardController < ApplicationController
  before_action :require_login

  def home
    @user = current_user
    @user_pending_invites = @user.invites.where(status: Invite::PENDING).includes(:event)
    @events = @user.upcoming_events.order("start_time")
    @pending = @user.upcoming_meetings.order("start_time")
    @finished = @user.finished_events.order("start_time")
  end
end
