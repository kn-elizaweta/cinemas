module Filter
  class Movies
    def self.filter(params, movies)
      if params[:is_active] != nil
      movies = movies.joins(:sessions).
                where("sessions.date > ?", DateTime.now)
      end
      if params[:cinema_id] != nil
        movies = movies.joins(:cinemas).where(cinemas: {id: params[:cinema_id]})
      end
      movies
    end
  end
end