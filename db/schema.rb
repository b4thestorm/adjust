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

ActiveRecord::Schema.define(version: 20150324225316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employee_shifts", force: true do |t|
    t.integer  "employee_id"
    t.integer  "shift_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "friend_id"
  end

  add_index "employee_shifts", ["employee_id"], name: "index_employee_shifts_on_employee_id", using: :btree
  add_index "employee_shifts", ["shift_id"], name: "index_employee_shifts_on_shift_id", using: :btree

  create_table "employees", force: true do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "username"
  end

  create_table "notifies", force: true do |t|
    t.boolean  "notify"
    t.integer  "employee_id"
    t.integer  "notifyable_id"
    t.string   "notifyable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", force: true do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
    t.string   "position"
    t.datetime "shift_day"
  end

end
