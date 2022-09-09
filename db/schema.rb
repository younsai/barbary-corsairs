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

ActiveRecord::Schema[7.0].define(version: 2022_09_08_130346) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.string "phone_number"
    t.string "logo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "experts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "github_account"
    t.string "twitter"
    t.string "cv"
    t.string "website_portfolio"
    t.text "bio"
    t.string "idendity_number"
    t.string "idendity_photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experts_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title"
    t.text "terms"
    t.bigint "company_id"
    t.bigint "report_perimeter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "accepted_vulnerabilities"
    t.text "excluded_vulnerabilities"
    t.text "vulnerability_levels"
    t.string "bounty_range"
    t.index ["company_id"], name: "index_programs_on_company_id"
    t.index ["report_perimeter_id"], name: "index_programs_on_report_perimeter_id"
  end

  create_table "report_perimeters", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_targets", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.text "summary"
    t.boolean "paid", default: false
    t.text "details"
    t.bigint "program_id", null: false
    t.bigint "expert_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expert_id"], name: "index_reports_on_expert_id"
    t.index ["program_id"], name: "index_reports_on_program_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reports", "experts"
  add_foreign_key "reports", "programs"
end
