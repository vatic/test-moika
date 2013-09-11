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

ActiveRecord::Schema.define(version: 20130910100316) do

  create_table "car_washes", force: true do |t|
    t.string   "title"
    t.string   "address"
    t.float    "lat"
    t.float    "lon"
    t.string   "contacts"
    t.string   "services"
    t.string   "price"
    t.integer  "zones_count"
    t.string   "actions"
    t.string   "video_url1"
    t.string   "video_url2"
    t.boolean  "signal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
