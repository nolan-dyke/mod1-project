class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :beers, :type, :beer_type
  end
end
