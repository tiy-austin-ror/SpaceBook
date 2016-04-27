class CampusesController < ApplicationController
before_action :company_validation, except: [:index]
before_action :set_campus, only: [:show, :update, :destroy]
  def index
    @campuses = current_user.company.campuses
  end

  def show
    @rooms = @campus.rooms.order( average_capacity_use: :DESC )
  end

  def new
    @campus = Campus.new
  end

  def create
    @campus = Campus.new(campus_params)
    @campus.company_id = current_user.company.id
    save_for_html_json(@campus, "show") { campus_path(@campus) }
  end

  def update
    @campus.assign_attributes(campus_params)
    save_for_html_json(@campus, "edit") { campus_path(@campus) }
  end

  def destroy
    destroy_html_json(@campus, campus_path(@campus))
  end

  def events
    @campus = Campus.find(params[:campus_id])
    if current_user.admin?
      @campus_events = @campus.all_events
    else
      @campus_events = @campus.public_events
    end

    @campus_events = @campus.events.includes(:room, :user)
    respond_to do |format|
      format.html { }
      format.pdf do
        render pdf: 'event-report', disable_external_links: true, template: 'campuses/events.html.erb'
      end
      format.csv do
        render text: @campus_events.to_csv
      end
    end
  end

  private

    def set_campus
      @campus = Campus.find(params[:id])
    end

    def campus_params
      params.require(:campus)
    end

end
