class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code,    null: false
      t.integer     :prefecture_id,  null: false
      t.string      :city,           null: false
      t.string      :street,         null: false
      t.string      :building,       null: true
      t.integer     :tel,            null: false
      t.references  :customer,       null: false, foreign_key: true
      t.timestamps
    end
  end
end