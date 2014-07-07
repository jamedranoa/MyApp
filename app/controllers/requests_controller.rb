class RequestsController < ApplicationController
  def new

  end

  def create

    @request = current_user.made_requests.new(request_params)
    @request.place = Place.find(params[:place_id])
    if @request.save
      if request.xhr?
          render partial: "success"
      else
          redirect_to "/"
      end
    else
      flash[:errors] = @request.errors.full_messages
      render :new
    end
  end

  def approve

    @request = current_user.requests.find(params[:id])
    @request.update(approved: true)
    current_user.places.find(@request.place_id).reserve_dates(@request)

    redirect_to user_url(current_user)
  end

  def deny
    @request = current_user.requests.find(params[:id])
    @request.approved = false
    @request.save

    redirect_to user_url(current_user)
  end


  private
  def request_params
    params.require(:request).permit(:start_date, :end_date, :message)
  end
end
