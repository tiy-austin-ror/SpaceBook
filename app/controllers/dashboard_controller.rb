class DashboardController < ApplicationController
before_action :require_login
  def home
    @user = current_user
    @events = @user.upcoming_events
    @pending = @user.upcoming_meetings
    @finished = @user.finished_events
  end

  private
    def get_user
      User.find(current_user.id)
    end
end
