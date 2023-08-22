class AddPriceToSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :sessions, :price, :string
  end
end
