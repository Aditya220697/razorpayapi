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

ActiveRecord::Schema[7.0].define(version: 2023_06_27_130701) do
  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fund_accounts", force: :cascade do |t|
    t.string "entity"
    t.string "account_type"
    t.string "ifsc"
    t.string "name"
    t.string "bank_account"
    t.string "account_number"
    t.string "vpa_address"
    t.boolean "active"
    t.integer "contact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_fund_accounts_on_contact_id"
  end

  create_table "payouts", force: :cascade do |t|
    t.string "account_number"
    t.integer "amount"
    t.string "currency"
    t.string "mode"
    t.string "purpose"
    t.integer "fund_account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fund_account_id"], name: "index_payouts_on_fund_account_id"
  end

  create_table "pays", force: :cascade do |t|
    t.string "name"
    t.string "contact_no"
    t.string "email"
    t.string "upi_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fund_accounts", "contacts"
  add_foreign_key "payouts", "fund_accounts"
end
