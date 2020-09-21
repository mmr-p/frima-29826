class RenameDaysToShipColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :day_to_ship, :days_to_ship_id
  end
end
