module ApplicationHelper

  def bookmark_saved?(spot)
    current_user&.bookmarks&.exists?(spot_id: spot.id)
  end

end
