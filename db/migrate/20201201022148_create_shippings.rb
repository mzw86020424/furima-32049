class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :addresses,     null: false
      t.text       :building
      t.string     :phone,         null: false
      t.string     :postal_code,   null: false
      t.string     :city,          null: false
      t.integer    :prefecture_id, null: false
      t.references :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
