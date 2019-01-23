class CartHistriesController < ApplicationController
  def create
    cart_history = Cart_history.new(cart_history_params)
    cart_history.save
  end

  private
  def cart_history_params
    params.require(:cart_history).permit(:history_id, :item_id, :price, :amount, )
  end
end
