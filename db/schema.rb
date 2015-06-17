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

ActiveRecord::Schema.define(version: 20150610122957) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.string   "name",       limit: 255,   default: "",        null: false
    t.string   "email",      limit: 255,   default: "",        null: false
    t.text     "content",    limit: 65535
    t.string   "ip",         limit: 255,   default: "0.0.0.0", null: false
    t.boolean  "status",     limit: 1,     default: false,     null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "resume",       limit: 255
    t.text     "content",      limit: 65535
    t.datetime "published_at"
    t.boolean  "status",       limit: 1,     default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

end
