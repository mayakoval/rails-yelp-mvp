class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  # It's in restaurants controller
  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant, notice: "Your review on #{@restaurant.name} was successfully added."
    else
      render :new
    end
  end

  private

  def set_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
