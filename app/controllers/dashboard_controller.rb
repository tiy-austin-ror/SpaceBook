class DashboardController < ApplicationController

  def home
    @user = get_user
  end

  private
    def get_user
      User.find(current_user.id)
    end
end
