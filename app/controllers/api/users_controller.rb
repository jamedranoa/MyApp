class Api::UsersController < ApplicationController
  before_action :require_signed_out!, :only => [:create, :new]

  def index
    @users = User.all
    render json: @users
  end
  
  def show
      @user = User.find(params[:id])
      render json: @user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      render json: @user
    else
     render :json => @comment.errors, :status => :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :age, :fname, :password, :lname,:education, :job, :picture, :sex)
  end


end