class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :genre, null: false
      t.integer :condition, null: false
      t.integer :shipping_fee_info, null: false
      t.integer :location, null: false
      t.integer :day_to_ship, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
