class SearchesController < ApplicationController
  
  def new
  end
  
  def perform
    @places = Place.where(city: search_city)
  
    @places = @places.select{|place| place.compatible_dates(search_dates)} 
    
    if @places
      flash[:search]= @places.map{|place| place.id}
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
    (Date.parse(params[:search][:start_date])..Date.parse(params[:search][:end_date])).to_a
  end
  
  def search_city
    params[:search][:city].split(" ").map!{|word| word.capitalize}.join(" ")
  end
  
end
