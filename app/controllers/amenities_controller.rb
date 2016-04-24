class AmenitiesController < ApplicationController
  before_action :set_amenity, only: [:show, :update, :destroy]
  def index
    @amenities = Amenity.all
  end

  def show
  end

  def new
    @amenity = Amenity.new
  end

  def create
    @amenity = Amenity.new(amenity_params)
    save_for_html_json(@amenity, "new") { amenity_path(@aminity) }
  end

  def update
    @amenity.assign_attributes(amenity_params)
    save_for_html_json(@amenity, "edit") { amenity_path(@aminity) }
  end

  def destroy
    @amenity.destroy
    respond_to do |format|
      format.html { redirect_to amenities_url, notice: 'Amenities was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_amenity
    @amenity = Amenity.find(params[:id])
  end

  def amenity_params
    params.require(:amenity).permit(:name, :room_amenity_id)
  end
end
