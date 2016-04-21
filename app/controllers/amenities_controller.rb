class AmenitiesController < ApplicationController
  def index
    @amenities = Amenity.all
  end

  def show
    @amenity = Amenity.find(params[:id])
  end

  def new
    @amenity = Amenity.new
  end

  def create
    @amenity = Amenity.new(amenity_params)

    respond_to do |format|
      if @amenity.save
        format.html { redirect_to @amenity, notice: 'Amenity was successfully created.' }
        format.json { render :show, status: :created, location: @amenity }
      else
        format.html { render :new }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_amenity
    respond_to do |format|
      if @amenity.update(amenity_params)
        format.html { redirect_to @amenity, notice: 'Amenity was successfully updated.' }
        format.json { render :show, status: :ok, location: @amenity }
      else
        format.html { render :edit }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
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
