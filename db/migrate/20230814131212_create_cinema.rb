class CreateCinema < ActiveRecord::Migration[7.0]
  def change
    create_table :cinemas do |t|
      t.string :name
      t.string :cinema_hall_count
      t.string :location
      t.timestamps
    end
  end
end
