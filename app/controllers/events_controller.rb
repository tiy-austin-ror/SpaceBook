class EventsController < ApplicationController
before_action :set_campus_room_event, only: [:edit, :update, :destroy]
before_action :set_campus_room, only: [:create, :new]
before_action :set_event, only: [:show]

  def index
    @events = Event.where(room: params[:room_id])
  end

  def show
    #TODO Fetching all users instead of users just in campus

    @users = User.all
    @event = Event.find(params[:id])
    @room = @event.room
    @campus = @room.campus
    @comments = @event.comments.order(created_at: :desc)
    respond_to do |format|
      format.html { }
      format.json { render json: @comments }
    end
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = @room.events.new(event_params.merge(user_id: current_user.id))
    save_for_html_json(@event, "new") {campus_room_event_path(@campus, @room, @event)}
  end

  def update
    @event.assign_attributes(event_params)
    save_for_html_json(@event, "edit") {campus_room_event_path(@campus, @room, @event)}
  end

  def destroy
    destroy_html_json(@event, campus_room_path(@campus, @room))
  end

  private


  def set_event
    @event = Event.find(params[:id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_campus
    @campus = Campus.find(params[:campus_id])
  end

  def set_campus_room_event
    set_campus
    set_room
    set_event
  end

  def set_campus_room
    set_room
    set_campus
  end

  def event_params
    params.require(:event).permit(:name, :description,
                                  :start_time, :duration,
                                  :private, :open_invite,
                                  :room_id, :user_id, :agenda )
  end



end
