class ReviewsController < ApplicationController

  def new
  	@restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
  	@review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    respond_to do |format|
    	if @review.save
      		format.html { redirect_to @review.restaurant, notice: "your review was successfully saved" }
    	else
      		format.html { render :new }
    	end
  	end
end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
