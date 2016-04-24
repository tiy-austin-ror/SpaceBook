class DashboardController < ApplicationController
before_action :require_login
  def home
    @user = get_user
    @events = current_user.events
    @pending = @user.meetings
  end

  private
    def get_user
      User.find(current_user.id)
    end
end
