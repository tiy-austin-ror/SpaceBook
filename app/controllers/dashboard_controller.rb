class DashboardController < ApplicationController
  def home
    @user = current_user
    @events = @user.upcoming_events.order("start_time")
    @pending = @user.upcoming_meetings.order("start_time")
    @finished = @user.finished_events.order("start_time")
  end

  private
    def get_user
      User.find(current_user.id)
    end
end
