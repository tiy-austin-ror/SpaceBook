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

ActiveRecord::Schema.define(version: 20160422010843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "campus_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "campus_users", ["campus_id"], name: "index_campus_users_on_campus_id", using: :btree
  add_index "campus_users", ["user_id"], name: "index_campus_users_on_user_id", using: :btree

  create_table "campuses", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "picture_url"
    t.string   "name"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body",       null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "events", ["room_id"], name: "index_events_on_room_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invites", ["event_id"], name: "index_invites_on_event_id", using: :btree
  add_index "invites", ["user_id"], name: "index_invites_on_user_id", using: :btree

  create_table "room_amenities", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "room_amenities", ["amenity_id"], name: "index_room_amenities_on_amenity_id", using: :btree
  add_index "room_amenities", ["room_id"], name: "index_room_amenities_on_room_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "campus_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name"
    t.string   "location"
    t.integer  "capacity"
    t.string   "picture_url"
    t.integer  "events_count"
    t.integer  "average_event_duration"
    t.integer  "average_attendance_count"
    t.integer  "average_capacity_use"
  end

  add_index "rooms", ["campus_id"], name: "index_rooms_on_campus_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "username",                                       null: false
    t.string   "name",                                           null: false
    t.string   "email",                                          null: false
    t.string   "phone_num",                                      null: false
    t.string   "profile_pic"
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
    t.boolean  "admin",                          default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "campus_users", "campuses"
  add_foreign_key "campus_users", "users"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "rooms"
  add_foreign_key "events", "users"
  add_foreign_key "invites", "events"
  add_foreign_key "invites", "users"
  add_foreign_key "room_amenities", "amenities"
  add_foreign_key "room_amenities", "rooms"
  add_foreign_key "rooms", "campuses"
end
