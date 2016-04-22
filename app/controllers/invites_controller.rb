class InvitesController < ApplicationController

  def create
  end

  def update
  end

  def destroy
  end

  private
  def get_invite
    Invite.find(params[:invite_id])
  end

  def invite_params
    params.require(:invite).permit(:status, :invite_id)
  end
end
