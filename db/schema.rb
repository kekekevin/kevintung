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

ActiveRecord::Schema.define(version: 20130711052745) do

  create_table "par_items", force: true do |t|
    t.text     "description"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "par_sheet_items", force: true do |t|
    t.integer  "par_count"
    t.integer  "par_sheet_id"
    t.integer  "par_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "par_sheet_items", ["par_item_id"], name: "index_par_sheet_items_on_par_item_id"
  add_index "par_sheet_items", ["par_sheet_id"], name: "index_par_sheet_items_on_par_sheet_id"

  create_table "par_sheets", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performers", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performers_slots", force: true do |t|
    t.integer "slot_id"
    t.integer "performer_id"
  end

  add_index "performers_slots", ["performer_id"], name: "index_performers_slots_on_performer_id"
  add_index "performers_slots", ["slot_id"], name: "index_performers_slots_on_slot_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "state"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prep_sheet_items", force: true do |t|
    t.integer  "prep_sheet_id"
    t.integer  "count"
    t.integer  "par_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "prep_count"
    t.integer  "par_count"
  end

  add_index "prep_sheet_items", ["par_item_id"], name: "index_prep_sheet_items_on_par_item_id"
  add_index "prep_sheet_items", ["prep_sheet_id"], name: "index_prep_sheet_items_on_prep_sheet_id"

  create_table "prep_sheets", force: true do |t|
    t.integer  "par_sheet_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "prep_sheets", ["par_sheet_id"], name: "index_prep_sheets_on_par_sheet_id"

  create_table "slots", force: true do |t|
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
