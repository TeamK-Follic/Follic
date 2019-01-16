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
    redirect_to 
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