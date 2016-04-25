class RoomsController < ApplicationController
  before_action :admin_validation, only: [:new, :edit, :create, :update, :destroy]
  before_action :get_campus, only: [:new, :create]
  before_action :get_room, only: [:show ]
  before_action :get_room_campus, only: [:update, :edit]


  def index
<<<<<<< HEAD
    @rooms = Room.search(params[:search])
=======
    @rooms = Room.all.order("average_capacity_use")
>>>>>>> 996d1c580714d075455eabdf2d15ec74f53295b0
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    save_for_html_json(@room, "new") {campus_room_path(@campus, @room)}
  end

  def edit
  end

  def update
    @room.assign_attributes(room_params)
    save_for_html_json(@room, "edit") {campus_room_path(@campus, @room)}
  end

  def destroy
    destroy_html_json(@room, "/")
  end



  private

  def get_room_campus
    get_room
    get_campus
  end

  def get_room
    @room = Room.find(params.fetch(:id))
  end

  def get_campus
    @campus = Campus.find(params[:campus_id])
  end

  def room_params
    params.require(:room).permit(:name, :campus_id, :location,
      :capacity, :picture_url)
  end
end
