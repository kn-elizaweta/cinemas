class RemoveCinemasIdFromCinemasMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :cinemas_movies, :cinemas_id, :integer
  end
end
