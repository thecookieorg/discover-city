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

ActiveRecord::Schema.define(version: 20160322175243) do

  create_table "accommodations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "price_per_night"
    t.string   "free_wi_fi"
    t.string   "air_conditioned"
    t.string   "breakfast"
    t.string   "child_friendly"
    t.string   "airport_shuttle"
    t.string   "gym"
    t.string   "parking"
    t.string   "laundry_service"
    t.string   "pool"
    t.string   "restaurant"
    t.string   "hot_tub"
    t.string   "smoke_free"
    t.string   "accessible"
    t.string   "pets_allowed"
    t.string   "spa"
    t.string   "bar"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "address"
    t.string   "phone"
    t.string   "logo"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "booking_url"
  end

  create_table "liquor_stores", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "website"
    t.string   "hours_monday"
    t.string   "hours_tuesday"
    t.string   "hours_wednesday"
    t.string   "hours_thursday"
    t.string   "hours_friday"
    t.string   "hours_saturday"
    t.string   "hours_sunday"
    t.string   "delivery"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "logo"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "order_online"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "website"
    t.string   "order_online"
    t.string   "monday_hours"
    t.string   "tuesday_hours"
    t.string   "wednesday_hours"
    t.string   "thursday_hours"
    t.string   "friday_hours"
    t.string   "saturday_hours"
    t.string   "sunday_hours"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.integer  "user_id"
    t.string   "logo"
    t.string   "cuisines"
    t.string   "cost_for_two"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "restaurants", ["cached_votes_down"], name: "index_restaurants_on_cached_votes_down"
  add_index "restaurants", ["cached_votes_score"], name: "index_restaurants_on_cached_votes_score"
  add_index "restaurants", ["cached_votes_total"], name: "index_restaurants_on_cached_votes_total"
  add_index "restaurants", ["cached_votes_up"], name: "index_restaurants_on_cached_votes_up"
  add_index "restaurants", ["cached_weighted_average"], name: "index_restaurants_on_cached_weighted_average"
  add_index "restaurants", ["cached_weighted_score"], name: "index_restaurants_on_cached_weighted_score"
  add_index "restaurants", ["cached_weighted_total"], name: "index_restaurants_on_cached_weighted_total"
  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.text     "bio"
    t.integer  "age"
    t.string   "gender"
    t.string   "profile_pic"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

  create_table "weather_grids", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "weather_grids", ["user_id"], name: "index_weather_grids_on_user_id"

  create_table "weather_locations", force: :cascade do |t|
    t.integer  "weather_grid_id"
    t.string   "city"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "weather_locations", ["weather_grid_id"], name: "index_weather_locations_on_weather_grid_id"

end
