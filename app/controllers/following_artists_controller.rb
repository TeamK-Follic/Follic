class FollowingArtistsController < ApplicationController
  before_action :authenticate_user!

  def index
     @user = User.find(current_user.id)
     @artist = Artist.find(current_user.id)
     @artists = Artist.all
     @events = Event.all
     @items = Item.all
  #   if @fartists.exist?
  #       @artists.each do |artist|
  #     fartist.event_id = artist.event.id
  #     fartist.item_id = artist.item.id
  #      end
  # end
end

  def show
    @fartists = current_user.following_artists.all
    @fartist = FollowingArtist.find(params[:id]).artist
    @items = @fartist.items
    @events = @fartist.events
  end

  def create
    @user = User.find(current_user.id)
  	@artists = user.artists
    @events = artist.events
    @items = artist.items
    @fartists = artists
    @fartist.save
    redirect_to artist_path(artist)
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    follow = current_user.following_artists.find_by(artist_id: artist.id)
    follow.destroy
    redirect_to artist_path(artist)
  end

  private
  def following_artist_params
    params.require(:following_artist).permit(
      users_attributes: [:id, :deleted_user],
      artists_attributes: [:id, :name, :image])
  end
end
