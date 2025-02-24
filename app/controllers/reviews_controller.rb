class ReviewsController < ApplicationController

  before_action :require_login, only: %i[new]
  
  def index
    @reviews = Review.includes(:spot, :user).all
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).includes(:spot, :user)
  end

  def new
    @review = Review.new 
    @spot = Spot.find(params[:spot_id])
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to spot_path(@review.spot)
    end
  end

  private

  def review_params
    params.require(:review).permit(:body).merge(spot_id: params[:spot_id])
  end
end
