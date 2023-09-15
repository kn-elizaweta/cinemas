#оставить только те кинотеатры, где идёт определенный фильм
module Filter
  class CinemaFilm
    def self.filter(params,cinema)
      if params[:movie_id] != nil
      cinema = cinema.joins(:movies).where(movies: {id: params[:movie_id]})
      end
      if params[:name] != nil
      cinema = cinema.where(name: params[:name])
      end
      cinema
    end
  end
end