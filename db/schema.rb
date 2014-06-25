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

ActiveRecord::Schema.define(version: 20140625181920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  add_index "places", ["address"], name: "index_places_on_address", using: :btree
  add_index "places", ["city"], name: "index_places_on_city", using: :btree
  add_index "places", ["country"], name: "index_places_on_country", using: :btree
  add_index "places", ["neighborhood"], name: "index_places_on_neighborhood", using: :btree
  add_index "places", ["price"], name: "index_places_on_price", using: :btree
  add_index "places", ["title"], name: "index_places_on_title", using: :btree

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
