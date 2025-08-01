class SpotsController < ApplicationController
  skip_before_action :require_login
  
  def map
    @spots = Spot.includes(:category).all
  end

  def index
    @q = Spot.ransack(params[:q])
    @spots = @q.result(distinct: true).includes(:category).page(params[:page])
  end

  def show
    @spot = Spot.find(params[:id])
    @review = Review.new
    @reviews = @spot.reviews.includes(:user).order(created_at: :desc)
  end

  def bookmarks
    @bookmark_spots = current_user.bookmark_spots.includes(:user).order(created_at: :desc)
  end

  def auto_search
    @spots = Spot.where("name ILIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end
end