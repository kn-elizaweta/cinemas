class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    movies = Movies.all
    movies = Filter::Movies.filter(params, movies)
    render json: movies, each_serializer: Movies::MovieIndexSerializer
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie, serializer: Movies::MovieShowSerializer
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
    params.require(:movie).permit(:id, :name, :genre, :duration, :avatar, grades_attributes:
     [:id, :grade, :user_id, :movie_id, :_destroy], reviews_attributes: [:id, :review,
      :grade_id, :user_id, :movie_id, :_destroy])
  end
end
