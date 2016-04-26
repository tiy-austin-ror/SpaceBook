class InvitesController < ApplicationController

  def create
    @invite = Invite.new(invite_params)
    @event = Event.find(params[:invite][:event_id])
    @room = @event.room
    @campus = @event.campus
    save_for_html_json(@invite, "/events/show") { :back }
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
