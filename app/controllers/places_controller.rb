class PlacesController < ApplicationController

  def new
    @place = current_user.places.new()
  end

  def create
    @place = current_user.places.new(place_params)

    if @place.save
      redirect_to :root #place_url(@place)
    else
      flash[:errors] = @place.errors.full_messages
      render :new
    end
  end

  def show
    @place = current_user.places.find(params[:id])
  end


  private
  def place_params
    params.require(:place).permit(:title, :type, :max_guest, :price, :bed_type, :num_bathrooms, :num_beds, :country, :city, :neighborhood, :address, :picture)
  end

end
