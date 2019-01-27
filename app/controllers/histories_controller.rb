class HistoriesController < ApplicationController
  before_action :authenticate_manager!, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:show, :index, :create]

  def show
    @history = History.find(params[:id])
    @cart_histories = @history.cart_histories
  end

  def index
    if manager_signed_in?
      @search = History.ransack(params[:q])
      @search_histories = @search.result.page(params[:page]).reverse_order
    elsif user_signed_in?
      @histories = current_user.histories.all.reverse_order
    else
      redirect_to users_about_path
    end
  end

  def create
    @user = User.find(current_user.id)
    @carts = @user.carts
    @history = @user.histories.new(history_params)
    @carts.each do |cart|
      # 在庫数チェック
      amount = cart.amount
      stock = cart.item.stock
      if amount > stock
        redirect_to carts_path, alert: '他のユーザーの商品の購入により、入力の数量を準備できません。購入数量を変更してください。'
      end
      # @historyに紐づいたcart_historiesに、保存すべきデータをコピー
      ch = @history.cart_histories.new
      ch.item_id = cart.item.id    # カートに含まれる商品のitem_id
      ch.price = cart.item.price   # カートに含まれる商品の価格
      ch.amount = cart.amount      # カートに含まれる商品の数量
    end
    # ユーザーデータのコピー
    @history.status_id = 0
    @history.postal_code = @user.postal_code
    @history.address = @user.address
    @history.name = @user.name
    @history.save
    # 購入した商品の最古を減らし、カートの中身削除
    @carts.each do |cart|
      item = Item.find(cart.item.id)        # カートに含まれる商品を呼び出す
      item.stock = item.stock - cart.amount # 商品の在庫を、購入した数量分だけ減らす
      item.save                             # 商品情報の更新
      cart.destroy
    end
    redirect_to histories_path
  end

  def update
  	search = History.find(params[:id])
    search.update(history_params)
    redirect_to histories_path
  end

  private
  def history_params
    params.require(:history).permit(
      :status_id, :postal_code, :address, :name, :payment_id,
      cart_histories_attributes: [:id, :history_id, :item_id, :price, :amount, :_destroy
      ]
    )
  end
end
