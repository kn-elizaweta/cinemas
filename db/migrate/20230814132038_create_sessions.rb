class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.references :movie
      t.string :viewers_count
      t.string :time
      t.timestamps
    end
  end
end
