class MusicsController < ApplicationController

	def create
		music = Music.new(music_params)
		music.save
		redirect_to 
	end

	def update
		music = Music.find(params[:id])
		music.update
		redirect_to 
	end

	def destroy
		music = Music.find(params[:id])
		music.destroy
		redirect_to 
	end

	private
	def music_params
		
	end
end
