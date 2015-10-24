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

ActiveRecord::Schema.define(version: 20150630210434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "subdomain"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_shifts", force: true do |t|
    t.integer  "shift_id"
    t.integer  "employee_id"
    t.integer  "coworker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",      default: "pending"
  end

  create_table "employees", force: true do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "username"
    t.integer  "account_id"
    t.string   "authcode"
    t.integer  "department_id"
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id", using: :btree

  create_table "invites", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifies", force: true do |t|
    t.boolean  "notify"
    t.integer  "employee_id"
    t.integer  "notifyable_id"
    t.string   "notifyable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "shifts", force: true do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
    t.string   "position"
    t.datetime "shift_day"
    t.integer  "account_id"
  end

end
