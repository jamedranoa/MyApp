class PlacesController < ApplicationController

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.new(place_params)
    if params[:first_pic]
      @place.place_pics.new(picture: params[:first_pic][:picture])
    else
      @place.place_pics.new()
    end

    if @place.save
      redirect_to :root #place_url(@place)
    else
      flash[:errors] = @place.errors.full_messages
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
    @reviews= Kaminari.paginate_array(@place.reviews.reverse).page(params[:page]).per(5)
  end

  def index
    @places = Place.first(4)
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

  def block
    @place = current_user.places.find(params[:id])
    @reserve_date=@place.reserved_dates.new(block_params)
    if @reserve_date.save
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

  def block_params
    params.require(:block).permit(:day)
  end

end
