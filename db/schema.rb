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

ActiveRecord::Schema.define(version: 20181021145702) do

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_tokens", force: :cascade do |t|
    t.string "token"
    t.string "refresh_token"
    t.datetime "expired_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_auth_tokens_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "size_id"
    t.integer "user_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_carts_on_product_id"
    t.index ["size_id"], name: "index_carts_on_size_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "size_id"
    t.integer "order_id"
    t.integer "quantity"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_detail_orders_on_order_id"
    t.index ["product_id"], name: "index_detail_orders_on_product_id"
    t.index ["size_id"], name: "index_detail_orders_on_size_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "link"
    t.string "media_type"
    t.integer "media_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "store_id"
    t.text "address"
    t.string "phone"
    t.float "ship_cost"
    t.float "total"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_orders_on_store_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "role_id"
    t.integer "action_id"
    t.string "sub_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_permissions_on_action_id"
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id"
    t.integer "store_id"
    t.string "name"
    t.integer "product_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.integer "rate"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_rates_on_product_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipper_orders", force: :cascade do |t|
    t.integer "shipper_id"
    t.integer "order_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shipper_orders_on_order_id"
    t.index ["shipper_id"], name: "index_shipper_orders_on_shipper_id"
  end

  create_table "shippers", force: :cascade do |t|
    t.integer "user_id"
    t.string "identity_number"
    t.integer "status", default: 0
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_shippers_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.integer "product_id"
    t.string "size"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sizes_on_product_id"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.time "open_at"
    t.time "close_at"
    t.text "description"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role_id"
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "phone"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
