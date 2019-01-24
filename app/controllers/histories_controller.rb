class HistoriesController < ApplicationController
  # before_action :authenticate_manager!, only: [:update, :destroy]
  def show
    @history = History.find(params[:id])
  end

  def index
    if manager_signed_in?
      @search = History.ransack(params[:q])
      @search_histories = @search.result.page(params[:page]).reverse_order
    elsif user_signed_in?
      @histories = current_user.histories.all
    else
      redirect_to users_about_path
    end
  end

  def create
   #  user = User.find(params[:id])
  	# history = User.history.new(history_params)
   #  history.user_id = user.id
   #  history.save
   #  redirect_to histories_path
      cart_history = Cart_history.new(cart_history_params)
      cart_history.save
      history = History.new(history_params)
      history.cart_history_id = history.id
      history.save
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
