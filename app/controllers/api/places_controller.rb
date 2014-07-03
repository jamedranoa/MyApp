class Api::PlacesController < ApplicationController

  def index

    @places = Place.all
    render json: @places
  end

  def show
    @place = Place.find(params[:id])
    render json: @place
  end

  def update
    @place = current_user.places.find(params[:id])

    if @place.update(place_params)
      render json: @place
    else
      render :json => @comment.errors, :status => :unprocessable_entity
    end
  end


  private

  def place_params
    params.require(:place).permit(:title, :kind, :max_guest, :price, :bed_type, :num_bathrooms, :num_beds, :country, :city, :neighborhood, :address, :picture)
  end

end