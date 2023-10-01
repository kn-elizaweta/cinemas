class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :grades, :grade, :rating
  end
end
