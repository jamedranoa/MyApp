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
    @place = Place.find(params[:id])
  end
  
  def index 
    @places = Place.all
  end


  def edit
    @place = current_user.places.find(params[:id])
  end

  def update
    @place = current_user.places.find(params[:id])

    if @place.update(place_params)
      render :show
    else
      flash[:errors] = @place.errors.full_messages
      render :edit
    end
  end


  private
  def place_params
    params.require(:place).permit(:title, :kind, :max_guest, :price, :bed_type, :num_bathrooms, :num_beds, :country, :city, :neighborhood, :address, :picture)
  end

end
