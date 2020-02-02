class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name,            null: false
      t.string :size,            null: false
      t.text :description,       null: false
      t.string :state,           null: false
      t.string :price,           null: false
      t.string :delivery_charge, null: false
      t.string :delivery_method, null: false
      t.string :delivery_area,   null: false
      t.string :delivery_date,   null: false
      t.references :category,    null: false, foreign_key: true
      t.references :user,        null: false, foreign_key: true
      t.references :brand,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
