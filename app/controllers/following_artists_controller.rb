class FollowingArtistsController < ApplicationController
  def index
    @fartists = current_user.following_artists.all
  end

  def show
    @fartists = current_user.following_artists.all
    @fartist = FollowingArtist.find(params[:id]).artist
    @items = @fartist.items
    @events = @fartist.events
  end

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
