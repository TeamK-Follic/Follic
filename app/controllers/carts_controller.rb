class CartsController < ApplicationController
  # before_action :authenticate_user!

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
    @item = Item.find(params[:item_id])
    @cart = @item.carts.new(cart_params)
    @cart.item_id = @item.id
    @cart.user_id = current_user.id
    if @cart.save
      redirect_to carts_path, notice: 'カートに商品を追加しました'
    end
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to carts_path, notice: '商品の数量を変更しました'
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path, notice: 'カートから商品を削除しました'
  end

  private
  def cart_params
    params.require(:cart).permit(:user_id, :item_id, :amount)
  end
end