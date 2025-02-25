class ProfilesController < ApplicationController
  before_action :set_user, only: [:index]

  def index
    @bookmark_spots = @user.bookmark_spots
  end

  private

  def set_user
    @user = current_user
  end
end
