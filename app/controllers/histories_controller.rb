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
      cart_history = Cart_history.find(params[:id])
      history.cart_history_id = History.id
      history.save
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
      users_attributes: [:name, :name_kana, :postal_code, :address, :phone_number, :email, :encrypted_password, :deleted_user
      ]
    )
  end
  # def search_params
  #   params.require(@search).permit(:user_id, :payment_id, :status_id, :postal_code, :address, :name)
  # end
end
