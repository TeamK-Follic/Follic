class HistoriesController < ApplicationController
  def show
    @history = histories.find(params[:id])
  end

  def index
    if current_manager_sigh_in?
      @histories = histories.all
    elsif current_user_sigh_in?
      @histories = current_user.histories.all
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
