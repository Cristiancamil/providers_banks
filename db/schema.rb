# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_15_140148) do
  create_table "countries", primary_key: "country_code", id: :string, force: :cascade do |t|
    t.string "country_name"
    t.string "country_flag"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "departments", primary_key: "department_code", id: :string, force: :cascade do |t|
    t.string "department_name"
    t.string "country_code"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "providers", primary_key: "nit", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "name_contact"
    t.string "phone_contact"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "departments", "countries", column: "country_code", primary_key: "country_code"
end
