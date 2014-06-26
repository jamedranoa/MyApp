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

ActiveRecord::Schema.define(version: 20140626192510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

# Could not dump table "account" because of following StandardError
#   Unknown type 'account_status' for column 'status'

  create_table "branch", primary_key: "branch_id", force: true do |t|
    t.string "name",    limit: 20, null: false
    t.string "address", limit: 30
    t.string "city",    limit: 20
    t.string "state",   limit: 2
    t.string "zip",     limit: 12
  end

  create_table "business", id: false, force: true do |t|
    t.integer "cust_id",                null: false
    t.string  "name",        limit: 40, null: false
    t.string  "state_id",    limit: 10, null: false
    t.date    "incorp_date"
  end

# Could not dump table "customer" because of following StandardError
#   Unknown type 'customer_type' for column 'cust_type_cd'

  create_table "department", primary_key: "dept_id", force: true do |t|
    t.string "name", limit: 20, null: false
  end

  create_table "employee", primary_key: "emp_id", force: true do |t|
    t.string  "fname",              limit: 20, null: false
    t.string  "lname",              limit: 20, null: false
    t.date    "start_date",                    null: false
    t.date    "end_date"
    t.integer "superior_emp_id"
    t.integer "dept_id"
    t.string  "title",              limit: 20
    t.integer "assigned_branch_id"
  end

  create_table "individual", id: false, force: true do |t|
    t.integer "cust_id",               null: false
    t.string  "fname",      limit: 30, null: false
    t.string  "lname",      limit: 30, null: false
    t.date    "birth_date"
  end

  create_table "officer", primary_key: "officer_id", force: true do |t|
    t.integer "cust_id",               null: false
    t.string  "fname",      limit: 30, null: false
    t.string  "lname",      limit: 30, null: false
    t.string  "title",      limit: 20
    t.date    "start_date",            null: false
    t.date    "end_date"
  end

  create_table "places", force: true do |t|
    t.integer  "owner_id",      null: false
    t.string   "title",         null: false
    t.string   "kind"
    t.integer  "max_guest"
    t.integer  "price"
    t.string   "bed_type"
    t.string   "num_bathrooms"
    t.string   "num_beds"
    t.string   "country"
    t.string   "city"
    t.string   "neighborhood"
    t.string   "address"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "s_date"
    t.date     "end_date"
  end

  add_index "places", ["address"], name: "index_places_on_address", using: :btree
  add_index "places", ["city"], name: "index_places_on_city", using: :btree
  add_index "places", ["country"], name: "index_places_on_country", using: :btree
  add_index "places", ["neighborhood"], name: "index_places_on_neighborhood", using: :btree
  add_index "places", ["price"], name: "index_places_on_price", using: :btree
  add_index "places", ["title"], name: "index_places_on_title", using: :btree

  create_table "product", id: false, force: true do |t|
    t.string "product_cd",      limit: 10, null: false
    t.string "name",            limit: 50, null: false
    t.string "product_type_cd", limit: 10, null: false
    t.date   "date_offered"
    t.date   "date_retired"
  end

  create_table "product_type", id: false, force: true do |t|
    t.string "product_type_cd", limit: 10, null: false
    t.string "name",            limit: 50, null: false
  end

  create_table "requests", force: true do |t|
    t.integer  "place_id"
    t.integer  "applicant_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["applicant_id"], name: "index_requests_on_applicant_id", using: :btree
  add_index "requests", ["place_id"], name: "index_requests_on_place_id", using: :btree

  create_table "reserved_dates", force: true do |t|
    t.integer  "place_id"
    t.date     "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reserved_dates", ["place_id", "day"], name: "index_reserved_dates_on_place_id_and_day", unique: true, using: :btree

# Could not dump table "transaction" because of following StandardError
#   Unknown type 'transaction_type' for column 'txn_type_cd'

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token"
    t.string   "fname",           null: false
    t.string   "lname"
    t.string   "education"
    t.string   "job"
    t.string   "sex"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
