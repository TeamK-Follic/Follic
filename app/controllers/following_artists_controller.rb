class FollowingArtistsController < ApplicationController
  before_action :authenticate_user!

  def index
     @user = User.find(current_user.id)
     @artists = @user.following_artists.all
     @artist = Artist.find(current_user.id)
     @events = @artist.events
     @fartist = 
     @fevents = Artist.find(fartist.artist.id).events.name
     @items = @artist.items
  end

  def show
     @user = User.find(current_user.id)
     @artists = @user.following_artists.all
     @artist = Artist.find(current_user.id)
     @events = @artist.events.all
     @items = @artist.items.all
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

