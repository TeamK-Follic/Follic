class HistoryController < ApplicationController
  def show
    @history = History.find(params[:id])
  end

  def index
    @histories = History.all
  end

  def create
  	history = History.new
    history.save
    redirect_to history_index_path
  end

  def update
  	history = History.find(params[:id])
    history.update
    redirect_to history_index_path
  end

  private
  def history_params
    
  end
end
