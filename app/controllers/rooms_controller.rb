class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room = get_room
  end

  def new
    @room = Room.new
    @campus = Campus.first
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to :back
    else
      render :new
    end
  end

  def edit
    @room = get_room
    @campus = Campus.first
  end

  def update
    @room = get_room

    if @room.update(room_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    @room = get_room

    if @room.destroy
      redirect_to :index
    else
      redirect_to :back
    end
  end

  private
  def get_room
    Room.find(params.fetch(:id))
  end

  def room_params
    params.require(:room).permit(:name, :campus_id, :location,
      :capacity, :picture_url)
  end
end
