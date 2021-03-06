class SessionsController < ApplicationController
  #before_action :require_signed_out!, :only => [:new, :create]
  before_action :require_signed_in!, :only => [:destroy]

  def new
  end

  def create
    sign_out
    @user = User.find_by_credentials(user_params[:email],user_params[:password])
    if @user
      sign_in(@user)
      redirect_to root_url(@user)
    else
      flash[:errors] = ["Invalid Credentials"]
      redirect_to root_url
    end
  end

  def destroy
     sign_out
     redirect_to places_url
   end

   private

   def user_params
     params.require(:user).permit(:email, :password)
   end

end
