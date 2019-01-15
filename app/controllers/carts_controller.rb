class CartsController < ApplicationController
  def index
  	@carts = Cart.all
  end

  def confirm
  end

  def create
  end

  def update
  	@cart = Cart.find(params[:id])
  	cart.update
  	render :index
  end

  def destroy
  	@cart = Cart.find(params[:id])
  	cart.destroy
  end
end
