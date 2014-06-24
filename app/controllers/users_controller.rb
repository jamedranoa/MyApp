class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user_params.password != params[confirm]
      flash.now[:errors] = "Passwords must match"
    end
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :fname, :password, :lname)
  end


end
