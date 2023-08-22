class AddColumnToCinemasMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :cinemas_movies, :cinema
    add_reference :cinemas_movies, :movie
  end
end
