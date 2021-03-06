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

ActiveRecord::Schema.define(version: 20161201033126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "image_source"
  end

  create_table "amenities_listings", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "amenity_id", null: false
  end

  add_index "amenities_listings", ["listing_id", "amenity_id"], name: "index_amenities_listings_on_listing_id_and_amenity_id", using: :btree

  create_table "authentications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.string   "user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "name"
    t.string   "city"
    t.string   "address"
    t.decimal  "price"
    t.boolean  "availability"
    t.integer  "max_occupancy"
    t.integer  "number_of_rooms"
    t.string   "description"
    t.integer  "user_id"
    t.json     "avatars"
    t.string   "amenities_group", default: [],              array: true
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "listings_searches", id: false, force: :cascade do |t|
    t.integer  "listing_id", null: false
    t.integer  "search_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "listings_searches", ["listing_id", "search_id"], name: "index_listings_searches_on_listing_id_and_search_id", using: :btree

  create_table "models", force: :cascade do |t|
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal  "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.date     "booked_date"
    t.date     "check_out_date"
    t.decimal  "ind_cost",        precision: 6, scale: 2
    t.string   "special_request"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "payment_id"
    t.date     "check_in_date"
    t.string   "reference_code"
  end

  add_index "reservations", ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
  add_index "reservations", ["payment_id"], name: "index_reservations_on_payment_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.boolean  "available"
    t.decimal  "low_price"
    t.decimal  "high_price"
    t.string   "city"
    t.integer  "max_occupancy"
    t.integer  "number_of_rooms"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "amenities",       default: [],              array: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "first_name"
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128,             null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.integer  "role",                           default: 0
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "listings", "users"
  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "payments"
  add_foreign_key "reservations", "users"
end
