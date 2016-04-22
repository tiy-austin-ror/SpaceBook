class InvitesController < ApplicationController

  def create

  end

  def update
  end

  def destroy
  end

  private
  def get_invite
    Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:status, :event_id, :user_id)
  end
end
