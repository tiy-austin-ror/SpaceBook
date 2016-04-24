class CampusesController < ApplicationController
before_action :admin_validation, only: [:create, :update, :destroy]
before_action :set_campus, only: [:show, :update, :destroy]
  def index
    @campuses = Campus.all
  end

  def show
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
    @campus.destroy
    respond_to do |format|
      format.html { redirect_to campuses_url, notice: 'Campus was successfully destroyed.' }
      format.json { head :no_content }
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
