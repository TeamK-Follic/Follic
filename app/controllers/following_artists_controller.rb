class FollowingArtistsController < ApplicationController
  def index
  	@fartists = FollowingArtist.all
  end

  def create
  	fartist = FollowingArtist.new(fartist_params)
    fartist.save
    redirect_to following_artists_index_path
  end

  def destroy
  	fartist = FollowingArtist.find(params[:id])
  	fartist.destroy
  	redirect_to artists_show_path
  end

  private
  def following_artist_params
    params.require(:fartist).permit(:user_id, :artist_id)
  end
end
