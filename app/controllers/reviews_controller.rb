class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  expose(:review)
  expose(:product)
  expose(:category)

  def create
    self.review = Review.new(review_params)
    self.review.user = current_user

    if review.save
      product.reviews << review
      redirect_to [product.category, product], notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    unless current_user == review.user or current_user.try(:admin?)
      redirect_to [product.category, product], notice: 'You are not allowed to remove this review.'
    end

    review.destroy
    redirect_to [product.category, product], notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
