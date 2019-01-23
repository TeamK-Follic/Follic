class MusicsController < ApplicationController
	# before_action :authenticate_manager!, only: [:new, :edit, :create, :update, :destroy]
	def create
		music = Music.new(music_params)
		music.save
		redirect_to items_edit_path
	end

	def update
		music = Music.find(params[:id])
		music.update
		redirect_to items_edit_path
	end

	def destroy
		music = Music.find(params[:id])
		music.destroy
		redirect_to items_edit_path
	end

	private
	def music_params
		params.require(:music).permit(:disc_id, :track_number, :name)
	end
end
