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

ActiveRecord::Schema.define(version: 20140130170401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_texts", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_types", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "actions", force: true do |t|
    t.integer  "car_wash_id"
    t.integer  "action_text_id"
    t.integer  "action_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", force: true do |t|
    t.string   "file"
    t.string   "filename"
    t.string   "place"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_wash_id"
    t.string   "type"
  end

  add_index "banners", ["car_wash_id"], name: "index_banners_on_car_wash_id", using: :btree
  add_index "banners", ["type"], name: "index_banners_on_type", using: :btree

  create_table "car_washes", force: true do |t|
    t.string   "title"
    t.string   "address"
    t.float    "lat"
    t.float    "lon"
    t.string   "contacts"
    t.text     "services"
    t.string   "price"
    t.integer  "zones_count"
    t.string   "video_url1"
    t.string   "video_url2"
    t.boolean  "signal",         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "site_url"
    t.boolean  "blink",          default: false
    t.boolean  "signal_changed"
    t.boolean  "activated",      default: false
    t.string   "official_title"
    t.string   "u_address"
    t.string   "inn"
    t.boolean  "action_on_map",  default: false
    t.boolean  "youtubed",       default: false
    t.string   "vk_url"
    t.string   "odn_url"
    t.integer  "rating",         default: 0
    t.boolean  "videoned",       default: false
    t.string   "signal_type"
  end

  create_table "comments", force: true do |t|
    t.string   "name"
    t.integer  "car_wash_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.decimal  "value",      precision: 8, scale: 2
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "car_wash_id"
    t.string   "address"
    t.string   "title"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "inn"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id",                   null: false
    t.integer  "receiver_id",                 null: false
    t.string   "subject",                     null: false
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_wash_id"
    t.boolean  "read",        default: false
  end

  add_index "messages", ["car_wash_id"], name: "index_messages_on_car_wash_id", using: :btree
  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "payments", force: true do |t|
    t.boolean  "confirmed",   default: false
    t.boolean  "verified",    default: false
    t.boolean  "failed",      default: true
    t.integer  "car_wash_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "text"
    t.integer  "car_wash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",        default: false
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "static_pages", force: true do |t|
    t.string   "title"
    t.text     "header"
    t.text     "content"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_wash_id"
    t.string   "phone"
    t.string   "contact_person"
    t.string   "car_wash_title"
  end

  add_index "users", ["car_wash_id"], name: "index_users_on_car_wash_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
