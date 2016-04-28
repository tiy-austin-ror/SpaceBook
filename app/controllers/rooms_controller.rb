class RoomsController < ApplicationController
  before_action :company_validation
  before_action :get_campus, only: [:new, :create]
  before_action :get_room, only: [:show ]
  before_action :get_room_campus, only: [:update, :edit]


  def index
    @rooms = Room.where(campus_id: params[:campus_id])
    # @rooms = Room.all.order("average_capacity_use")

    respond_to do |format|
      format.json { render json: @rooms.to_json(include: :amenities) }
      format.html
    end
  end

  def show
    @room = get_room
    @events = @room.events.where(private: "false") + current_user.meetings.where(room_id: @room.id, private: "true")
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
