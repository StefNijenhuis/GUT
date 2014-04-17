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

ActiveRecord::Schema.define(version: 20140417085117) do

  create_table "testmethods", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testpeople", force: true do |t|
    t.string   "age"
    t.string   "name"
    t.string   "email"
    t.string   "browser"
    t.string   "ip"
    t.string   "os"
    t.string   "resolution"
    t.boolean  "gender"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usertests", force: true do |t|
    t.integer  "userid"
    t.string   "title"
    t.text     "introtext"
    t.integer  "methodid"
    t.datetime "end_date"
    t.datetime "start_date"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
