class TypesController < ApplicationController
  def new
  	@type = Type.new
  end

  def create
  	type = Type.new(type_params)
  	type.save
  end

  private
  params.require(@type).permit(:name)
end
