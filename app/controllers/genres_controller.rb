class GenresController < ApplicationController
  # before_action :authenticate_manager!
  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to artists_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
