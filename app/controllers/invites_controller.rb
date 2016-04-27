class InvitesController < ApplicationController

  def create
    @event = Event.find(params[:invite][:event_id])
    @room = @event.room
    @campus = @event.campus
    user_id = params[:invite][:user_id] || current_user.id
    params[:invite][:status] = "Pending" unless current_user.id == user_id
    @invite = Invite.new(invite_params.merge(user_id: user_id))
    save_for_html_json(@invite, "/events/show") { :back }
  end

  def update
    get_invite
    @event = @invite.event
    @room = @event.room
    @campus = @event.campus
    @invite.assign_attributes(invite_params.merge(user_id: current_user.id)) if @invite.user_id == current_user.id
    save_for_html_json(@invite, "/events/show") { :back }
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
    params.require(:invite).permit(:status, :event_id)
  end
end
