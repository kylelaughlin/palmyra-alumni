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

ActiveRecord::Schema.define(version: 20161211155355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer  "rsvp_id"
    t.string   "name"
    t.integer  "event_option_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "classmates", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.boolean  "is_private"
    t.string   "class_year"
    t.index ["email"], name: "index_classmates_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_classmates_on_reset_password_token", unique: true, using: :btree
  end

  create_table "event_options", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "classmate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "classmate_id"
    t.integer  "total_cost"
    t.string   "payment_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "event_id"
  end

end
