class TypesController < ApplicationController
  before_action :authenticate_manager!

  def new
  	@type = Type.new
  end

  def create
  	type = Type.new(type_params)
  	type.save
    redirect_to items_path
  end

  private
  def type_params
    params.require(:type).permit(:name)
  end
end
