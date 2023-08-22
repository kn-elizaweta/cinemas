class RemoveDateFromSessions < ActiveRecord::Migration[7.0]
  def change
    remove_column :sessions, :date, :string
  end
end
