class CreateCinemasMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :cinemas_movies do |t|
      t.references :cinema
      t.references :movie
      t.timestamps
    end
  end
end
