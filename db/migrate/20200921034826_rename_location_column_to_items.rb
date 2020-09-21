class RenameLocationColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :location, :location_id
  end
end
