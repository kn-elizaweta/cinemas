class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    movies = Movies.all
    movies = Filter::Movies.filter(params, movies)
    render json: movies
  end

  def update
    movie = Movie.find(params[:id])
      if movie.update(movie_params)
        render json: movie
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def update_avatar
    movie = Movie.find(params[:id])
      if movie.avatar.attach(params[:avatar])        
        render json: movie
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def get_avatar
    movie = Movie.find(params[:id])
    redirect_to url_for(movie.avatar)
  end
  
  private
  def movie_params
    params.require(:movie).permit(:id, :name, :genre, :duration, :avatar)
  end
end
