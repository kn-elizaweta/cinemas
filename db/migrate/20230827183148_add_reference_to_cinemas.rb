class AddReferenceToCinemas < ActiveRecord::Migration[7.0]
  def change
    add_reference :sessions, :cinema
  end
end
