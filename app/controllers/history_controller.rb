class HistoryController < ApplicationController
  def show
    @history = History.find(params[:id])
    cart_history = Cart_history.find(params[:id])
    item = Item.find(params[:id])

  end

  def index
    @histories = History.all
    @artist = artist.find(params[:id])
    @cart = current_user.cart.find(params[:id])
  end

  def create
  	history = History.new
    history.save
    redirect_to histories_path
  end

  def update
  	history = History.find(params[:id])
    history.update
    redirect_to histories_path
  end

  private
  def history_params
    params.require(:user_id, :payment_id, :status_id, :postal_code, :address, :name)
  end
end
