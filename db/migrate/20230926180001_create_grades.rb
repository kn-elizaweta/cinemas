class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
     t.references :user
     t.references :movie
     t.integer :grade 
      t.timestamps
    end
  end
end
