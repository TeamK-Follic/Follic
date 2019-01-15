class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
  	item = Item.new(item_params)
    item.save
    redirect_to artists_show_path
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
    
    
  end
end
