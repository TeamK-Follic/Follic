class ItemsController < ApplicationController
  def new
    @artist = Artist.find(params[:id])
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @search = Item.ransack(params[:q])
    @search_items = @search.result.page(params[:page]).reverse_order
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
  	item = Item.new(item_params)
    item.save
    redirect_to artist_path(item.artist_id)
    artist = Artist.find(params[:artist_id])
    item = artist.items.new(item_params)
    item.artist_id = artist.id
    item.save
    redirect_to item_path(item.id)
  end

  def update
  	item = Item.find(params[:id])
    item.update
    redirect_to items_show_path
  end

  def destroy
  	item = Item.find(params[:id])
    item.destroy
    redirect_to items_index_path
  end

  private
  def item_params
    params.require(:item).permit(
      :title, :image_id, :type_id, :artist_id, :genre_id, :label_id, :price, :stock,
      discs_attributes: [:id, :item_id, :name, :_destroy]
    )
  end
end
