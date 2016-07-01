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

ActiveRecord::Schema.define(version: 20160628080854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_jobs", id: false, force: :cascade do |t|
    t.integer "job_id"
    t.integer "category_id"
  end

  add_index "categories_jobs", ["category_id"], name: "index_categories_jobs_on_category_id", using: :btree
  add_index "categories_jobs", ["job_id"], name: "index_categories_jobs_on_job_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["name"], name: "index_cities_on_name", unique: true, using: :btree

  create_table "cities_jobs", id: false, force: :cascade do |t|
    t.integer "city_id"
    t.integer "job_id"
  end

  add_index "cities_jobs", ["city_id"], name: "index_cities_jobs_on_city_id", using: :btree
  add_index "cities_jobs", ["job_id"], name: "index_cities_jobs_on_job_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "address",                default: ""
    t.integer  "city_id"
    t.string   "avatar"
    t.string   "resume"
  end

  add_index "employees", ["city_id"], name: "index_employees_on_city_id", using: :btree
  add_index "employees", ["email"], name: "index_employees_on_email", unique: true, using: :btree
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree

  create_table "employers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                   default: "", null: false
    t.text     "short_description",      default: "", null: false
    t.text     "full_description",       default: "", null: false
    t.text     "offer",                  default: "", null: false
    t.text     "address",                default: "", null: false
    t.string   "logo"
  end

  add_index "employers", ["email"], name: "index_employers_on_email", unique: true, using: :btree
  add_index "employers", ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true, using: :btree

  create_table "images", force: :cascade do |t|
    t.string  "file",        null: false
    t.integer "employer_id"
  end

  add_index "images", ["employer_id"], name: "index_images_on_employer_id", using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "job_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "content",     default: ""
  end

  add_index "job_applications", ["employee_id"], name: "index_job_applications_on_employee_id", using: :btree
  add_index "job_applications", ["job_id", "employee_id"], name: "index_job_applications_on_job_id_and_employee_id", unique: true, using: :btree
  add_index "job_applications", ["job_id"], name: "index_job_applications_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name",        default: "",   null: false
    t.boolean  "negotiable",  default: true
    t.integer  "min_salary",  default: 0
    t.integer  "max_salary",  default: 0
    t.text     "detail",      default: "",   null: false
    t.text     "requirement", default: "",   null: false
    t.text     "offer",       default: "",   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "employer_id"
  end

  add_index "jobs", ["employer_id"], name: "index_jobs_on_employer_id", using: :btree

  add_foreign_key "employees", "cities"
  add_foreign_key "images", "employers"
  add_foreign_key "jobs", "employers"
end
