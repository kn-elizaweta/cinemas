class AddBookingToViewers < ActiveRecord::Migration[7.0]
  def change
    add_column :viewers, :booking, :boolean
  end
end
