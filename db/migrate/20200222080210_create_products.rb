class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name,                null: false
      t.string :size,                null: false
      t.text   :description,         null: false
      t.references :state,           null: false, foreign_key: true
      t.string :price,               null: false
      t.references :delivery_charge, null: false, foreign_key: true
      t.references :delivery_method, null: false, foreign_key: true
      t.references :delivery_area,   null: false, foreign_key: true
      t.references :delivery_date,   null: false, foreign_key: true
      t.references :category,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
