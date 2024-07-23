# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_23_174842) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_favorites", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "favorite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_favorites_on_car_id"
    t.index ["favorite_id"], name: "index_car_favorites_on_favorite_id"
  end

  create_table "car_users", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_users_on_car_id"
    t.index ["user_id"], name: "index_car_users_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.integer "year"
    t.string "plate"
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_cars_on_store_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.integer "cnpj"
    t.integer "telephone_number"
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "cpf"
    t.string "driver_license"
    t.integer "card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "car_favorites", "cars"
  add_foreign_key "car_favorites", "favorites"
  add_foreign_key "car_users", "cars"
  add_foreign_key "car_users", "users"
  add_foreign_key "cars", "stores"
  add_foreign_key "favorites", "users"
end
