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

ActiveRecord::Schema.define(version: 20141020135039) do

  create_table "assets", force: true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.string   "translator_id"
    t.string   "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rate"
  end

  create_table "breakdowns", force: true do |t|
    t.string   "project_id"
    t.integer  "translated"
    t.integer  "context"
    t.integer  "repetition"
    t.integer  "format"
    t.integer  "hundred"
    t.integer  "ninety_five"
    t.integer  "eighty_five"
    t.integer  "seventy_five"
    t.integer  "fifty"
    t.integer  "nomatch"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort",         default: 0
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  create_table "links", force: true do |t|
    t.string   "order_id"
    t.string   "project_id"
    t.string   "translator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client_id"
  end

  create_table "notes", force: true do |t|
    t.string   "project_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "LLID"
    t.string   "value"
    t.integer  "category"
    t.boolean  "paid",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_id"
  end

  create_table "projects", force: true do |t|
    t.string   "lid"
    t.string   "cost"
    t.string   "source"
    t.string   "target"
    t.string   "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client"
    t.string   "client_id"
    t.boolean  "closed",              default: false
    t.date     "deadline"
    t.time     "time"
    t.date     "translator_deadline"
    t.time     "translator_time"
  end

  create_table "searches", force: true do |t|
    t.string   "conditions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "rate"
    t.string   "table"
  end

  create_table "translator_searches", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "translators", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "signature"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
