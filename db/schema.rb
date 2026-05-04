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

ActiveRecord::Schema[8.1].define(version: 2026_04_22_094424) do
  create_table "cash_balances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.datetime "created_at", null: false
    t.float "current_amount"
    t.float "financial_year"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_cash_balances_on_community_id"
  end

  create_table "common_areas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "area_type"
    t.bigint "community_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_common_areas_on_community_id"
  end

  create_table "communities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "address"
    t.string "bank_account"
    t.string "cif"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "expenses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "amount"
    t.bigint "cash_balance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "date"
    t.bigint "incidence_id", null: false
    t.string "status"
    t.bigint "supplier_id", null: false
    t.datetime "updated_at", null: false
    t.index ["cash_balance_id"], name: "index_expenses_on_cash_balance_id"
    t.index ["incidence_id"], name: "index_expenses_on_incidence_id"
    t.index ["supplier_id"], name: "index_expenses_on_supplier_id"
  end

  create_table "incidences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "date"
    t.string "description"
    t.string "photo"
    t.string "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["community_id"], name: "index_incidences_on_community_id"
    t.index ["user_id"], name: "index_incidences_on_user_id"
  end

  create_table "maintenances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "common_area_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "status"
    t.bigint "supplier_id", null: false
    t.datetime "updated_at", null: false
    t.index ["common_area_id"], name: "index_maintenances_on_common_area_id"
    t.index ["supplier_id"], name: "index_maintenances_on_supplier_id"
  end

  create_table "meetings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "date"
    t.string "type_meeting"
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_meetings_on_community_id"
  end

  create_table "notices", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.text "concept"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_notices_on_community_id"
  end

  create_table "properties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.datetime "created_at", null: false
    t.boolean "late_payment"
    t.string "number"
    t.string "payment_status"
    t.integer "total_owners"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["community_id"], name: "index_properties_on_community_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "receipts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cash_balance_id", null: false
    t.datetime "created_at", null: false
    t.date "date"
    t.float "monthly_price"
    t.bigint "property_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["cash_balance_id"], name: "index_receipts_on_cash_balance_id"
    t.index ["property_id"], name: "index_receipts_on_property_id"
  end

  create_table "reservations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "common_area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "date"
    t.string "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["common_area_id"], name: "index_reservations_on_common_area_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "suppliers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "cif"
    t.string "contact"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "service"
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "lastname"
    t.string "name"
    t.string "phone"
    t.integer "property_type"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role", default: 0
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cash_balances", "communities"
  add_foreign_key "common_areas", "communities"
  add_foreign_key "expenses", "cash_balances"
  add_foreign_key "expenses", "incidences"
  add_foreign_key "expenses", "suppliers"
  add_foreign_key "incidences", "communities"
  add_foreign_key "incidences", "users"
  add_foreign_key "maintenances", "common_areas"
  add_foreign_key "maintenances", "suppliers"
  add_foreign_key "meetings", "communities"
  add_foreign_key "notices", "communities"
  add_foreign_key "properties", "communities"
  add_foreign_key "properties", "users"
  add_foreign_key "receipts", "cash_balances"
  add_foreign_key "receipts", "properties"
  add_foreign_key "reservations", "common_areas"
  add_foreign_key "reservations", "users"
end
