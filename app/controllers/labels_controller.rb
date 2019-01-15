class LabelsController < ApplicationController
  def index
    @labels = Label.all
  end

  def edit
    @label = Label.find(params[:id])
  end

  def create
    label = Label.new(label_params)
    label.save
    redirect_to labels_index_path
  end

  def destroy
    label = Label.find(params[:id])
    label.destroy
    redirect_to labels_index_path
  end

  private
  def label_params
    params.require(:label).permit(:name)
  end
end
