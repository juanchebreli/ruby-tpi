# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_05_231209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "cuild"
    t.string "nombre"
    t.integer "iva"
    t.string "mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "phone_id"
    t.index ["phone_id"], name: "index_clients_on_phone_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "phones", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id", null: false
    t.bigint "numero"
    t.index ["client_id"], name: "index_phones_on_client_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "codigo"
    t.string "descripcion"
    t.integer "montoU"
    t.text "detalle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservation_items", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "item_id", null: false
    t.integer "price"
    t.index ["item_id"], name: "index_reservation_items_on_item_id"
    t.index ["reservation_id"], name: "index_reservation_items_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "fecha"
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.boolean "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "sale_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sale_id", null: false
    t.bigint "item_id", null: false
    t.integer "price"
    t.index ["item_id"], name: "index_sale_items_on_item_id"
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "fecha"
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "reservation_id"
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["reservation_id"], name: "index_sales_on_reservation_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "password_digest"
  end

  add_foreign_key "clients", "phones"
  add_foreign_key "items", "products"
  add_foreign_key "phones", "clients"
  add_foreign_key "reservation_items", "items"
  add_foreign_key "reservation_items", "reservations"
  add_foreign_key "reservations", "clients"
  add_foreign_key "reservations", "users"
  add_foreign_key "sale_items", "items"
  add_foreign_key "sale_items", "sales"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "reservations"
  add_foreign_key "sales", "users"
end
