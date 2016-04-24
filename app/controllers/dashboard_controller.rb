class DashboardController < ApplicationController
before_action :require_login
  def home
    @user = get_user
  end

  private
    def get_user
      User.find(current_user.id)
    end
end
