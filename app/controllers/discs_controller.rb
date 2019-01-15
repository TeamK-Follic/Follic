class DiscsController < ApplicationController
	def create
		disc = Disc.new(disc_params)
		disc.save
		redirect_to
	end

	def update
		
	end

	def destroy
		
	end

	private
	def disc_params
		
	end
end
