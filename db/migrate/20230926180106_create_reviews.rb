class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :movie
      t.references :grade
      t.text :review
      t.timestamps
    end
  end
end
