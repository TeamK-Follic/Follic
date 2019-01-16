class ArtistsController < ApplicationController
  def new
  	@artist = Artist.new
  end

  def show
  	@artist = Artist.find(params[:id])
  end

  def index
    @search = Artist.ransack(params[:q])
    @search_artists = @search.result
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def create
  	artist = Artist.new(artist_params)
  	atist.save
  	redirect_to artists_show_path
  end

  def update
  	artist = Artsit.find(params[:id])
  	artist.update(artist_params)
  	redirect_to artists_show_path
  end

  def destroy
  	artist = Artist.find(params[:id])
  	artist.destroy
  	redirect_to artists_index
  end

  private
  def artist_params
  	params.require(:artist).permit(:name, :name_kana, :img, :intro)
  end
end
