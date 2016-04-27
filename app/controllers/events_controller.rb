require 'csv'

class EventsController < ApplicationController
before_action :company_validation
before_action :set_campus_room_event, only: [:edit, :update, :destroy]
before_action :set_campus_room, only: [:create, :new]
before_action :set_event, only: [:show]

  def index
    if current_user.admin?
      @events = Event.where(room: params[:room_id]).includes(:room, :user)
    else
      @events = Event.where(room: params[:room_id, public: true]).includes(:room, :user)
    end

    respond_to do |format|
      format.html { }
      format.pdf do
        render pdf: 'event-report', disable_external_links: true, template: 'events/index.html.erb'
      end
      format.csv do
        render text: @events.to_csv
      end
    end
  end

  def show
    @users = current_user.company.users
    @event = Event.find(params[:id])
    @room = @event.room
    @campus = @room.campus
    @comments = @event.comments.order(created_at: :desc)
    @invites = @event.invites.order(created_at: :desc)
    respond_to do |format|
      format.html { }
      format.pdf do
        render pdf: 'event-report', template: 'events/show.html.erb'
      end

      format.json { render json: {comments: @comments,
                                  invites: @invites} }
    end
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = @room.events.new(event_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @event.save
        EventMailer.new_event(@event).deliver_now
        #TODO text_schedule(@event)  Don't enable this, it will text me everytime an event is added.
        format.html { redirect_to campus_room_event_path(@campus, @room, @event) }
        format.json { render json: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event.assign_attributes(event_params)
    save_for_html_json(@event, "edit") {campus_room_event_path(@campus, @room, @event)}
  end

  def destroy
    destroy_html_json(@event, campus_room_path(@campus, @room))
  end

  private

  def text_schedule(event)
    account_sid = '#'
    auth_token = '#'
      # = Placeholders, currently keeping these off for security.
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+17372104484',
    	:to => '15126275853',
    	:body => 'You have an event scheduled for ' + (event.formatted_start_time) + '. ' +
                'It is in ' + event.room.name + ' at ' + event.room.location + ' and lasts for ' + (event.formatted_event_duration * 15).to_s + ' minutes.',
    })
  end


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
                                  :room_id, :user_id, :agenda, :allow_remote )
  end



end
