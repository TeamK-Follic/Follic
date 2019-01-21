class CartsController < ApplicationController
  def index
    @carts = User.find(current_user.id).carts.all
    @cart = Cart.new
  end

  def show
    @cart_history = User.find(current_user.id).cart_history.find(params[:id])
    @history = current_user.hitory.find(params[:id])
  end

  def confirm
    @carts = User.find(current_user.id).carts.all
  end

  def create
    item = Item.find(params[:item_id])
    cart = item.carts.new(cart_params)
    cart.item_id = item.id
    cart.user_id = current_user.id
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
    redirect_to carts_path
  end

  private
  def cart_params
    params.require(:cart).permit(:user_id, :item_id, :amount)
  end
end