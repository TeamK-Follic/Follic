class ArtistsController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :edit, :create, :update, :destroy]

  def new
  	@artist = Artist.new
  end

  def show
  	@artist = Artist.find(params[:id])
    @items = @artist.items.all.reverse_order.limit(3)
    @events = @artist.events.page(params[:page]).per(5).order('datetime ASC')
  end

  def index
    @search = Artist.ransack(params[:q])
    @search_artists = @search.result.page(params[:page]).reverse_order
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def create
  	@artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id), notice: 'アーティスト情報を追加しました'
    else
      flash.now[:alert] = 'アーティスト情報の追加に失敗しました'
      render :new
    end
  end

  def update
  	@artist = Artist.find(params[:id])
  	if @artist.update(artist_params)
      redirect_to artist_path(@artist.id), notice: 'アーティスト情報を編集しました'
    else
      flash.now[:alert] = 'アーティスト情報の編集に失敗しました'
      render :edit
    end
  end

  def destroy
  	artist = Artist.find(params[:id])
  	artist.destroy
  	redirect_to artists_path, notice: 'アーティスト情報を削除しました'
  end

  private
  def artist_params
  	params.require(:artist).permit(:name, :name_kana, :image, :intro)
  end
end
