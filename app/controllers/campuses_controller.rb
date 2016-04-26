class CampusesController < ApplicationController
# before_action :admin_validation, only: [:create, :update, :destroy]
before_action :set_campus, only: [:show, :update, :destroy]
  def index
    @campuses = Campus.all
  end

  def show
    @rooms = @campus.rooms.order( average_capacity_use: :DESC )
  end

  def new
    @campus = Campus.new
  end

  def create
    @campus = Campus.new(campus_params)
    save_for_html_json(@campus, "show") { campus_path(@campus) }
  end

  def update
    @campus.assign_attributes(campus_params)
    save_for_html_json(@campus, "edit") { campus_path(@campus) }
  end

  def destroy
    destroy_html_json(@campus, campus_path(@campus))
  end

  private

    def set_campus
      @campus = Campus.find(params[:id])
    end

    def campus_params
      params.require(:campus)
    end

end
