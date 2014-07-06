class ReviewsController < ApplicationController

  def new
  end

  def create
    @review = current_user.made_reviews.new(review_params)
    if @review.save
      if request.xhr?
          render partial: "review", locals: {review: @review}
      else
          redirect_to @review.reviewable
      end
    else
      flash[:errors] = @review.errors.full_messages
      redirect_to user_url(review_params.reviewable_id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :score, :reviewable_id, :reviewable_type)
  end

end
