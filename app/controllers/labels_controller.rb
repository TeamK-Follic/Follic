class LabelsController < ApplicationController
  def index
    @labels = Label.all
  end

  def edit
    @label = Label.find(params[:id])
  end

  private
  def label_params
    
  end
end
