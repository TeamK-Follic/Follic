class CartHistriesController < ApplicationController
	def create
		cart_history = Cart_history.new(cart_history_params)
		cart_history.save
	end
end
