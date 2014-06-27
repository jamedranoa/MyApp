class SearchesController < ApplicationController
  
  def new
  end
  
  def perform
    @places = Place.where(city: search_city)
  
    @places.select!{|place| place.compatible_dates(search_dates)} if @places
 
    if @places
      flash[:search]= @places.pluck(:id)
      redirect_to results_search_url
    else
      flash[:errors] = ["No Results For Your Search"]
      render :new
    end
    
  end
  
  def results
    @places = Place.find(flash[:search])
  end
  
  private 
  def search_dates
    (params[:search][:start_date]..params[:search][:end_date]).to_a
  end
  
  def search_city
    params[:search][:city].split(" ").map!{|word| word.capitalize}.join(" ")
  end
  
end
