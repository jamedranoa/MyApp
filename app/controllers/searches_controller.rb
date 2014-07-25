class SearchesController < ApplicationController

  def new
  end

  def perform
    @places = Place.where(city: search_city)
    if params[:search][:start_date] < params[:search][:end_date]
      @places = @places.select{|place| place.compatible_dates(search_dates)}
    end
    if !@places.empty?
      session[:search]= @places.map{|place| place.id}
      redirect_to results_search_url
    else
      flash[:errors] = ["No Results For Your Search"]
      redirect_to root_url
    end

  end

  def results
    @places= Kaminari.paginate_array(Place.find(session[:search])).page(params[:page]).per(4)
  end

  private

  def search_dates
    (Date.parse(params[:search][:start_date])..Date.parse(params[:search][:end_date])).to_a
  end

  def search_city
    params[:search][:city].split(" ").map!{|word| word.capitalize}.join(" ")
  end

end
