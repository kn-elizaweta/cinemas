module Filter
  class Sessions
    def self.filter(params, sessions)
      if params[:date_first] != nil 
      sessions = sessions.where("date >= ?", DateTime.parse(params[:date_first]))
      end
      if params[:date_last] != nil
      sessions = sessions.where("date <= ?", DateTime.parse(params[:date_last]))  
      end
      if params[:cinema_id] != nil
      sessions = sessions.joins(movie: :cinemas).where(cinemas: {id: params[:cinema_id]})
      end
      if params[:movie_id] != nil
      sessions = sessions.where(movie_id: params[:movie_id])
      end
      sessions
    end
  end
end