class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @campus = Campus.find(:campus_id)
    @room = Room.find(:room_id)
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
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
    params.require(:event).permit(:start_time, :duration, :description, :room_id, :user_id, )
  end


end
