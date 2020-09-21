class RenameConditionColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :condition, :condition_id
  end
end
