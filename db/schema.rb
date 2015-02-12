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

ActiveRecord::Schema.define(version: 20150212101143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classroom_module_presents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "classroom_id"
    t.integer  "learning_module_id"
  end

  add_index "classroom_module_presents", ["classroom_id"], name: "index_classroom_module_presents_on_classroom_id", using: :btree
  add_index "classroom_module_presents", ["learning_module_id"], name: "index_classroom_module_presents_on_learning_module_id", using: :btree

  create_table "classrooms", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "teacher_id"
    t.integer  "program_id"
    t.boolean  "active",      default: true
    t.text     "description"
  end

  add_index "classrooms", ["program_id"], name: "index_classrooms_on_program_id", using: :btree
  add_index "classrooms", ["teacher_id"], name: "index_classrooms_on_teacher_id", using: :btree

  create_table "learning_modules", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "number"
    t.text     "presentation_embed_code"
    t.integer  "program_id"
  end

  add_index "learning_modules", ["program_id"], name: "index_learning_modules_on_program_id", using: :btree

  create_table "programs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
  end

  add_index "programs", ["name"], name: "index_programs_on_name", unique: true, using: :btree
  add_index "programs", ["slug"], name: "index_programs_on_slug", unique: true, using: :btree

  create_table "students", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "confirmation_token"
    t.boolean  "confirmed",          default: false
    t.integer  "classroom_id"
  end

  add_index "students", ["classroom_id"], name: "index_students_on_classroom_id", using: :btree

  create_table "surveys", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "form_embed_code"
    t.string   "type"
  end

  create_table "teachers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "phone"
    t.string   "position"
    t.string   "location"
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true, using: :btree

end
