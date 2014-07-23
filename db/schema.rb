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

ActiveRecord::Schema.define(version: 20140723130238) do

  create_table "assets", force: true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "pid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.string   "tid"
    t.string   "pid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "contact"
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
  end

  create_table "projects", force: true do |t|
    t.string   "lid"
    t.string   "cost"
    t.string   "source"
    t.string   "target"
    t.string   "count"
    t.datetime "created_at"
    t.datetime "updated_at"
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
