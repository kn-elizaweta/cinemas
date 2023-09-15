class CinemasController < ApplicationController
  def index
    cinema = Cinema.all
    cinema = Filter::CinemaFilm.filter(params,cinema)
    render json: cinema, each_serializer: Cinemas::CinemaIndexSerializer
  end

  def show
    cinema = Cinema.find(params[:id])
    render json: cinema, serializer: Cinemas::CinemaShowSerializer
  end

  def create
    cinema = Cinema.create!(cinema_params)
    render json: cinema
  end

  def destroy
    cinema = Cinema.find(params[:id])
    cinema.destroy
    render json: {status: "OK"}
  end

  private

  def cinema_params
    params.require(:cinema).permit(:name, :cinema_hall_count, :location, 
                                    movies_attributes: [:id, :name, :genre, :duration,
                                   :_destroy])
  end
end