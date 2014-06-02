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

ActiveRecord::Schema.define(version: 20140602092303) do

  create_table "association_attachments", force: true do |t|
    t.integer  "association_test_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "association_tests", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "usertestid"
    t.integer  "testpersonid"
    t.string   "result"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "usertests", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "introtext"
    t.integer  "methodname"
    t.datetime "end_date"
    t.datetime "start_date"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "outrotext"
    t.string   "product"
  end

end
