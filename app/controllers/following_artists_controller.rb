class FollowingArtistsController < ApplicationController
  def index
  	@fartist = Fartist.all
  end

  def create
  	fartist = Fartist.new(fartist_params)
    fartist.save
    redirect_to following_artists_index_path
  end

  def destroy
  	fartist = Fartist.find(params[:id])
  	fartist.destroy
  	redirect_to artists_show_path
  end

  private
  def following_artist_params
    params.require(:fartist).permit(:user_id, :artist_id)
  end
end
