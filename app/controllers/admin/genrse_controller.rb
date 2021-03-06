class Admin::GenrseController < ApplicationController
  
  def index
    @genre=Genre.new
    @genrse=Genre.all
  end
  
  def create
    @genre=Genre.new(genre_params)
    @genre.save
    redirect_to admin_genrse_index_path
  end

  def edit
    @genre=Genre.find(params[:id])
  end
  
  def update
    genre=Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genrse_index_path
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  
end
