class RemoveCinemaIdFromCinemasMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :cinemas_movies, :cinema_id, :integer
    remove_column :cinemas_movies, :movie_id, :integer
  end
end
