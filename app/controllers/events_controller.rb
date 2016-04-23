class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @campus = Campus.find(params[:campus_id])
    @room = Room.find(params[:room_id])
    @event = Event.new
  end

  def edit
  end

  def create
    @campus = Campus.find(params[:campus_id])
    @room = Room.find(params[:room_id])
    @event = @room.events.new(event_params.merge(user_id: current_user.id))
    if @event.save
      redirect_to campus_room_event_path(@campus, @room, @event)
    else
      flash[:danger] = "invalid input!"
      redirect_to :back
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @even.destroy
    respond_to do |format|
      format.html { redirect_to campus_room_event_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])

  end

  def event_params
    params.require(:event).permit(:name, :description,
                                  :start_time, :duration,
                                  :private, :open_invite,
                                  :room_id, :user_id )
  end


end
