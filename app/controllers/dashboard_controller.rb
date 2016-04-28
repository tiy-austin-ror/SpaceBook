class DashboardController < ApplicationController

  before_action :require_login


  def home
    @user = current_user
    @user_pending_invites = @user.invites.where(status: Invite::PENDING).includes(:event, :room)
    @user_accepted_invites = @user.invites.where(status: Invite::ACCEPTED).includes(:event, :room)
    @user_accepted_invites += @user.invites.where(status: Invite::REMOTE).includes(:event, :room)
    @events = @user.upcoming_events.order("start_time")
    @finished = @user.finished_events.order("start_time")
  end
end
