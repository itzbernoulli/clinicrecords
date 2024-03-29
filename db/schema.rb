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

ActiveRecord::Schema.define(version: 20190504090056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "appointments", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "date_of_birth"
    t.string   "appointment_date"
    t.string   "message"
    t.uuid     "disease_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["disease_id"], name: "index_appointments_on_disease_id", using: :btree
  end

  create_table "departments", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "icds", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_icds", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "record_id"
    t.uuid     "icd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["icd_id"], name: "index_record_icds_on_icd_id", using: :btree
    t.index ["record_id"], name: "index_record_icds_on_record_id", using: :btree
  end

  create_table "records", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "gender"
    t.string   "address"
    t.string   "health_care_provider"
    t.string   "complaints"
    t.string   "diagnosis"
    t.string   "treatment"
    t.string   "height"
    t.string   "weight"
    t.string   "temperature"
    t.string   "blood_pressure"
    t.string   "drugs_given"
    t.boolean  "nurse_updated",          default: false
    t.boolean  "doctor_updated",         default: false
    t.boolean  "pharmacist_updated",     default: false
    t.string   "front_desk_name"
    t.string   "nurse_name"
    t.string   "doctor_name"
    t.string   "pharmacist_name"
    t.datetime "nurse_update_time"
    t.datetime "doctor_update_time"
    t.datetime "pharmacist_update_time"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.uuid     "department_id"
    t.string   "admin_name"
    t.datetime "admin_update_time"
    t.index ["department_id"], name: "index_records_on_department_id", using: :btree
  end

  create_table "roles", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "title"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "admin_name"
    t.datetime "admin_update_time"
    t.boolean  "is_verified",            default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "diseases"
  add_foreign_key "record_icds", "icds"
  add_foreign_key "record_icds", "records"
  add_foreign_key "records", "departments"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
