class MoviesController < ApplicationController
  def index
    movies = Movies.all
    movies = Filter::Movies.filter(params, movies)
    render json: movies
  end
end
