class CartHistoriesController < ApplicationController
  def create
  	cart = Cart.find(params[:id])
    cart_history.cart_id = Cart_history.id
    cart_history.save
  end

  private
  def cart_history_params
    params.require(:cart_history).permit(:history_id, :item_id, :price, :amount)
  end
end