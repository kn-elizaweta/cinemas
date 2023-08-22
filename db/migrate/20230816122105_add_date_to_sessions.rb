class AddDateToSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :sessions, :date, :datetime
  end
end
