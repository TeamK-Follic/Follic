class FollowingArtistsController < ApplicationController
  before_action :authenticate_user!

  def index
     @user = User.find(current_user.id)

     @fartists = @user.following_artists.all
     @events = Event.all
     @items = Item.all
  end

  def show
     @user = User.find(current_user.id)
     @fartists = @user.following_artists.all
     @artist = Artist.find(params[:id])
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

