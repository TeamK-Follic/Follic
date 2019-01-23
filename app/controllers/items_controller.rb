class ItemsController < ApplicationController
  # before_action :authenticate_manager!, only: [:new, :edit, :create, :update, :destroy]
  def new
    @artist = Artist.find(params[:id])
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

  def index
    @search = Item.ransack(params[:q])
    @search_items = @search.result.page(params[:page]).reverse_order
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
  	@artist = Artist.find(params[:artist_id])
    @item = @artist.items.new(item_params)
    @item.artist_id = @artist.id
    if @item.save
      redirect_to item_path(@item), notice: '商品を追加しました'
    else
      flash.now[:alert] = '商品の追加に失敗しました'
      render "items/new"
    end
  end

  def update
  	@item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報を編集しました'
    else
      flash.now[:alert] = '商品の編集に失敗しました'
      render :edit
    end
  end

  def destroy
  	item = Item.find(params[:id])
    item.destroy
    redirect_to items_path, notice: '商品情報を削除しました'
  end

  private
  def item_params
    params.require(:item).permit(
      :title, :image, :type_id, :artist_id, :genre_id, :label_id, :price, :stock,
      discs_attributes: [:id, :item_id, :name, :_destroy,
        musics_attributes: [:id, :disc_id, :name, :_destroy]
      ]
    )
  end
end
