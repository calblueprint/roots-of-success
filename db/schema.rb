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

ActiveRecord::Schema.define(version: 20160527192032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "changelog_items", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
  end

  create_table "classroom_module_presents", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "classroom_id"
    t.integer  "learning_module_id"
  end

  add_index "classroom_module_presents", ["classroom_id"], name: "index_classroom_module_presents_on_classroom_id", using: :btree
  add_index "classroom_module_presents", ["learning_module_id"], name: "index_classroom_module_presents_on_learning_module_id", using: :btree

  create_table "classrooms", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "teacher_id"
    t.integer  "program_id"
    t.boolean  "active",        default: true
    t.text     "description"
    t.string   "card_image_id"
  end

  add_index "classrooms", ["program_id"], name: "index_classrooms_on_program_id", using: :btree
  add_index "classrooms", ["teacher_id"], name: "index_classrooms_on_teacher_id", using: :btree

  create_table "learning_modules", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "number"
    t.text     "presentation_embed_code"
    t.integer  "program_id"
  end

  add_index "learning_modules", ["program_id"], name: "index_learning_modules_on_program_id", using: :btree

  create_table "participant_surveys", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "form_embed_code"
    t.text     "description"
  end

  create_table "pre_post_tests", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.text     "link"
  end

  create_table "programs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
  end

  add_index "programs", ["name"], name: "index_programs_on_name", unique: true, using: :btree
  add_index "programs", ["slug"], name: "index_programs_on_slug", unique: true, using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "form_embed_code"
    t.text     "description"
    t.integer  "program_id"
  end

  add_index "quizzes", ["program_id"], name: "index_quizzes_on_program_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "confirmation_token"
    t.boolean  "confirmed",           default: false
    t.integer  "classroom_id"
    t.boolean  "survey_administered", default: false
  end

  add_index "students", ["classroom_id"], name: "index_students_on_classroom_id", using: :btree

  create_table "supplemental_materials", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "content"
    t.integer  "classroom_id", null: false
    t.string   "name"
    t.integer  "position"
  end

  add_index "supplemental_materials", ["classroom_id"], name: "index_supplemental_materials_on_classroom_id", using: :btree

  create_table "teacher_surveys", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "url"
    t.text     "description"
  end

  create_table "teachers", force: :cascade do |t|
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

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
