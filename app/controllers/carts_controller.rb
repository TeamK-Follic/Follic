class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def confirm
  end

  def create
  	cart = Cart.new(cart_params)
  end

  def update
  	cart = Cart.find(params[:id])
    cart.update(cart_params)
    render :index
  end

  def destroy
  	cart = Cart.find(params[:id])
    cart.destroy
    render :index
  end

  private
  def cart_params
    params.require(:cart).permit(:user_id, :item_id, :amount)
  end
end
