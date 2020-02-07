class CreateCellphoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :cellphone_numbers do |t|
      t.integer :cellphone_number
      t.references :user
      t.timestamps
    end
  end
end
