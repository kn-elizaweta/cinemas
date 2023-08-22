class AddBoughtToViewers < ActiveRecord::Migration[7.0]
  def change
    add_column :viewers, :bought, :boolean
  end
end
