class HistoryController < ApplicationController
  def show
    @history = current_user.history.find(params[:id])
  end

  def index
    @histories = current_user.history.all
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
