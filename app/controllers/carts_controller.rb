class CartsController < ApplicationController
  def index
  	@carts = Cart.all
    @carts = Cart.page(params[:page]).per(10)
  end

  def confirm
    carts = Cart.all
  end

  def create
    cart = Cart.new(cart_params)
    cart.save
    redirect_to carts_path
  end

  def update
  	cart = Cart.find(params[:id])
    cart.update(cart_params)
    redirect_to carts_path
  end

  def destroy
  	cart = Cart.find(params[:id])
    cart.destroy
    redirect_to cart_path(params[:id])
  end

  private
  def cart_params
    params.require(:cart).permit(:user_id, :item_id, :amount)
  end
end