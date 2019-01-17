class ArtistsController < ApplicationController
  def new
  	@artist = Artist.new
  end

  def show
  	@artist = Artist.find(params[:id])
    @items = @artist.items.all.reverse_order.limit(3)
    @events = @artist.events.all.reverse_order
  end

  def index
    @search = Artist.ransack(params[:q])
    @search_artists = @search.result.page(params[:page]).reverse_order
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def create
  	artist = Artist.new(artist_params)
  	artist.save
  	redirect_to artist_path(artist.id)
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
  	params.require(:artist).permit(:name, :name_kana, :image, :intro)
  end
end
