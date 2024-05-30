class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @spots = Spot.all
  end

  def profile
    @visits = Visit.where(user: current_user)
    @bookmarks = Bookmark.where(user: current_user)
    @reviews = Review.where(user: current_user)
  end
end
