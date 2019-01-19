class FollowingArtistsController < ApplicationController
  def create
  	artist = Artist.find(params[:artist_id])
    follow = current_user.following_artists.new(artist_id: artist.id)
    follow.save
    redirect_to artist_path(artist)
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    follow = current_user.following_artists.find_by(artist_id: artist.id)
    follow.destroy
    redirect_to artist_path(artist)
  end
end
