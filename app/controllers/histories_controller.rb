class HistoriesController < ApplicationController
  # before_action :authenticate_manager!, only: [:update, :destroy]
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
    # @historyに紐づいたcart_historiesに、保存すべきデータをコピー
    @carts.each do |cart|
      ch = @history.cart_histories.new
      ch.item_id = cart.item.id    # カートに含まれる商品のitem_id
      ch.price = cart.item.price   # カートに含まれる商品の価格
      ch.amount = cart.amount      # カートに含まれる商品の数量
    end
    # データが出揃ったので保存
    @history.status_id = 1
    @history.payment_id = 1
    @history.save
    @carts.each do |cart|
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
  # def search_params
  #   params.require(@search).permit(:user_id, :payment_id, :status_id, :postal_code, :address, :name)
  # end
end
