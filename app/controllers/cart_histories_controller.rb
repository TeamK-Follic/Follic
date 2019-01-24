class CartHistoriesController < ApplicationController
  def create
  	cart = Cart.new(cart_params)
  	cart.save
    cart_history.cart_id = Cart_history.id
    cart_history.save
  end

  private
  def cart_history_params
    params.require(:cart_history).permit(:history_id, :item_id, :price, :amount)
  def cart_params
    params.require(:cart).permit(:user_id, :item_id, :amount)
  end
  end
end