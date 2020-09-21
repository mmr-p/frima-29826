class RenameShippingFeeConditionColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_fee_info, :shipping_fee_info_id
  end
end
