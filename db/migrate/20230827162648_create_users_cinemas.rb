class CreateUsersCinemas < ActiveRecord::Migration[7.0]
  def change
    create_table :users_cinemas do |t|
      t.references :user
      t.references :cinema
      t.integer :discount
      t.timestamps
    end
  end
end
