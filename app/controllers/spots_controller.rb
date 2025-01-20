class SpotsController < ApplicationController
  skip_before_action :require_login
  
  def map
    @spots = Spot.all
  end

  def index
    @q = Spot.ransack(params[:q])
    @spots = @q.result(distinct: true).includes(:category).page(params[:page])
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
