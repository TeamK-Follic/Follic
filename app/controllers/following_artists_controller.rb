class FollowingArtistsController < ApplicationController
  def index
  	@fartist = Fartist.all
  end

  def create
  	fartist = Fartist.new(fartist_params)
  end

  def destroy
  	fartist = Fartist.find(params[:id])
  	fartist.destroy
  	redirect_to artists_show_path
  end

  private
  def following_artist_params
  	
  end
end
