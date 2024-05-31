class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]

  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def create
    @spot = Spot.find(params[:spot_id])
    Bookmark.create(user: current_user, spot: @spot)
    redirect_to bookmarks_path

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
