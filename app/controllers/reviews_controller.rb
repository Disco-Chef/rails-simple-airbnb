class ReviewsController < ApplicationController

  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @review = @flat.reviews.new(review_params)
    @review.save
    redirect_to flat_path(@flat)
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
