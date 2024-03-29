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

ActiveRecord::Schema[7.1].define(version: 2024_01_26_131748) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.integer "gender"
    t.integer "age"
    t.integer "role"
    t.text "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_members_on_first_name"
    t.index ["last_name"], name: "index_members_on_last_name"
  end

  create_table "opportunities", force: :cascade do |t|
    t.text "procedure_name"
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.jsonb "stage_history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_opportunities_on_doctor_id"
    t.index ["patient_id"], name: "index_opportunities_on_patient_id"
    t.index ["procedure_name"], name: "index_opportunities_on_procedure_name"
  end

  add_foreign_key "opportunities", "members", column: "doctor_id"
  add_foreign_key "opportunities", "members", column: "patient_id"
end
