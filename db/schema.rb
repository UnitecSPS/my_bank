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

ActiveRecord::Schema.define(version: 20150213014807) do

  create_table "account_types", force: true do |t|
    t.string   "title"
    t.decimal  "rate"
    t.decimal  "min_deposit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_accounts", force: true do |t|
    t.decimal  "balance"
    t.string   "currency"
    t.integer  "client_id"
    t.integer  "account_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "canceled_at"
  end

  add_index "bank_accounts", ["account_type_id"], name: "index_bank_accounts_on_account_type_id"
  add_index "bank_accounts", ["client_id"], name: "index_bank_accounts_on_client_id"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "identity"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "transactions", force: true do |t|
    t.decimal  "amount"
    t.string   "responsible"
    t.string   "transaction_type"
    t.text     "description"
    t.integer  "bank_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["bank_account_id"], name: "index_transactions_on_bank_account_id"

end
