# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200202075021) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.string   "size",                          null: false
    t.text     "description",     limit: 65535, null: false
    t.string   "state",                         null: false
    t.string   "price",                         null: false
    t.string   "delivery_charge",               null: false
    t.string   "delivery_method",               null: false
    t.string   "delivery_area",                 null: false
    t.string   "delivery_date",                 null: false
    t.integer  "category_id",                   null: false
    t.integer  "user_id",                       null: false
    t.integer  "brand_id",                      null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                       null: false
    t.string   "email",                          null: false
    t.string   "password",                       null: false
    t.string   "familyname",                     null: false
    t.string   "familyname_kana",                null: false
    t.string   "firstname",                      null: false
    t.string   "firstname_kana",                 null: false
    t.integer  "birthday",                       null: false
    t.integer  "cellphone_number",               null: false
    t.integer  "phone_number"
    t.text     "profile",          limit: 65535
    t.text     "profile_image",    limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
end
