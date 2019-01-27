class CartsController < ApplicationController
  before_action :jump_to_about, only: [:create]
  before_action :authenticate_user!


  def index
    @carts = User.find(current_user.id).carts.all
    @cart = Cart.new
  end



  def show
    @cart_history = User.find(current_user.id).cart_history.find(params[:id])
    @history = current_user.hitory.find(params[:id])
  end

  def confirm
    @user =User.find(current_user.id)
    @carts = @user.carts.all
    @carts.each do |cart|
      amount = cart.amount
      stock = cart.item.stock
      if amount > stock
        redirect_to carts_path, alert: '他のユーザーの商品の購入により、入力の数量を準備できません。購入数量を変更してください。'
      end
    end
    @history = @user.histories.new
  end

  def create
    @item = Item.new
    @cart = @item.carts.new(cart_params)
    if @cart.amount > @item.stock
      redirect_to carts_path, alert: '入力した数量に対し、在庫数が足りません。購入数量を変更してください。'
      return
    end
    @cart.item_id = @item.id
    @cart.user_id = current_user.id
    if @cart.save
      redirect_to carts_path, notice: 'カートに商品を追加しました'
    end
  end

  def update
    @cart = Cart.find(params[:id])
    if params[:cart][:amount].to_i > @cart.item.stock
      redirect_to carts_path, alert: '入力した数量に対し、在庫数が足りません。購入数量を変更してください。'
      return
    end
    if @cart.update(cart_params)
      redirect_to carts_path, notice: '商品の内容を変更しました'
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path, notice: 'カートから商品を削除しました'
  end

  def jump_to_about
    if user_signed_in?
    else
      redirect_to about_path, notice: '商品の購入には、会員登録・ログインが必要です。'
    end
  end

  private
  def cart_params
    params.require(:cart).permit(:user_id, :item_id, :amount)
  end
end
