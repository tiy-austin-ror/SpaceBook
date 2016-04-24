class InvitesController < ApplicationController

  def create
    @invite = Invite.new(invite_params)
    if @invite.save
      render json: { invite: @invite, message: "Success" }
    else
      #TODO: For temp message display
      render json: { message: @invite.errors[:user_id][0] }
    end
  end

  def update
    get_invite
    @invite.update
    render json: @invite
  end

  def destroy
    get_invite
    @invite.destroy
    render json: { message: "Invitation successfully removed" }
  end

  private
  def get_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:status, :event_id, :user_id)
  end
end
