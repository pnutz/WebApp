# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140327054339) do

  create_table "addresses", force: true do |t|
    t.text     "street_address"
    t.string   "zipcode"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "province_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "code"
  end

  create_table "extensions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folder_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "folders", force: true do |t|
    t.string   "name",           null: false
    t.text     "description"
    t.integer  "user_id",        null: false
    t.integer  "folder_type_id", null: false
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "folders", ["folder_id"], name: "index_folders_on_folder_id"
  add_index "folders", ["folder_type_id"], name: "index_folders_on_folder_type_id"
  add_index "folders", ["user_id"], name: "index_folders_on_user_id"

  create_table "item_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "province_states", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receipt_details", force: true do |t|
    t.integer  "receipt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shipping_address_id"
    t.integer  "billing_address_id"
  end

  add_index "receipt_details", ["billing_address_id"], name: "index_receipt_details_on_billing_address_id"
  add_index "receipt_details", ["receipt_id"], name: "index_receipt_details_on_receipt_id"
  add_index "receipt_details", ["shipping_address_id"], name: "index_receipt_details_on_shipping_address_id"

  create_table "receipt_items", force: true do |t|
    t.integer  "receipt_id"
    t.integer  "item_type_id"
    t.decimal  "cost",         precision: 19, scale: 4
    t.integer  "quantity"
    t.boolean  "is_credit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receipt_items", ["item_type_id"], name: "index_receipt_items_on_item_type_id"
  add_index "receipt_items", ["receipt_id"], name: "index_receipt_items_on_receipt_id"

  create_table "receipts", force: true do |t|
    t.decimal  "total"
    t.string   "transaction_number"
    t.integer  "purchase_type_id"
    t.string   "title"
    t.integer  "folder_id"
    t.text     "note"
    t.integer  "vendor_id"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
    t.integer  "user_id"
  end

  add_index "receipts", ["currency_id"], name: "index_receipts_on_currency_id"
  add_index "receipts", ["folder_id"], name: "index_receipts_on_folder_id"
  add_index "receipts", ["purchase_type_id"], name: "index_receipts_on_purchase_type_id"
  add_index "receipts", ["user_id"], name: "index_receipts_on_user_id"
  add_index "receipts", ["vendor_id"], name: "index_receipts_on_vendor_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "role",                   default: "user"
    t.datetime "expire_date",            default: '2000-01-01 00:00:00'
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vendors", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
