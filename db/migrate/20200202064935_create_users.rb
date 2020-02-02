class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :nickname,         null: false, unique: true
      t.string  :email,            null: false, unique: true
      t.string  :password,         null: false, unique: true
      t.string  :familyname,       null: false
      t.string  :familyname_kana,  null: false
      t.string  :firstname,        null: false
      t.string  :firstname_kana,   null: false
      t.integer :birthday,         null: false
      t.integer :cellphone_number, null: false
      t.integer :phone_number
      t.text    :profile
      t.text    :profile_image
      t.timestamps
    end
  end
end
