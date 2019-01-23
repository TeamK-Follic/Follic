class HistoriesController < ApplicationController
  # before_action :authenticate_manager!, only: [:update, :destroy]
  def show
    @history = histories.find(params[:id])
  end

  def index
    if manager_signed_in?
      @search = History.ransack(params[:q])
      @search_histories = @search.result.page(params[:page]).reverse_order
    elsif user_signed_in?
      @histories = current_user.history.all
    else
      redirect_to users_about_path
    end
  end

  def create
  	history = History.new(history_params)
    history.save
    redirect_to histories_path
  end

  def update
  	history = History.find(params[:id])
    history.update(history_params)
    redirect_to histories_path
  end

  private
  def history_params
    params.require(:user_id, :payment_id, :status_id, :postal_code, :address, :name)
  end
end
