class ReviewsController < ApplicationController
  
  def new
  end
  
  def create
    @review = current_user.made_reviews.new(review_params)
    if @review.save
      redirect_to current_user
    else
      flash[:errors] = @review.errors.full_messages
      render :new
    end
  end
  
  private 
  
  def review_params
    params.require(:review).permit(:body, :score, :reviewable_id, :reviewable_type)
  end
  
end
