class FollowingArtistsController < ApplicationController
  before_action :authenticate_user!

  def index
     @user = User.find(current_user.id)
     @artists = @user.following_artists
     @artist = Artist.find(current_user.id)
     @events = @artist.events
     @items = @artist.items
  end

  def show
  end

  def create
    artist = Artist.find(params[:artist_id])
    fartist = current_user.following_artists.new(artist_id: artist.id)
    fartist.save
    redirect_to artist_path(artist)
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    follow = current_user.following_artists.find_by(artist_id: artist.id)
    follow.destroy
    redirect_to artist_path(artist)
  end

end

