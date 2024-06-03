class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]

  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def create
    @bookmark = Bookmark.new
    @spot = Spot.find(params[:spot_id]) if params[:spot_id]
    @spot = Spot.find(params[:id]) if params[:id]
    @bookmark.user = current_user
    @bookmark.spot = @spot
    redirect_back(fallback_location: root_path) if @bookmark.save
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end

end
