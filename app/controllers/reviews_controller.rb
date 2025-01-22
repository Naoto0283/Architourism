class ReviewsController < ApplicationController

  before_action :require_login, only: %i[new]
  
  def index; end

  def new
    @review = Review.new 
    @spot = Spot.find(params[:spot_id])
  end

  def create
    @review = current_user.review.build(review_params)
    if @review.save
      redirect_to spot_path(@review.spot)
    end
  end

  private

  def review_params
    params.require(:review).permit(:body).merge(spot_id: params[:spot_id])
  end
end
