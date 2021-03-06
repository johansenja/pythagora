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

ActiveRecord::Schema.define(version: 2018_11_14_105619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "developer_id"
    t.boolean "successful"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "buyer_id"
    t.index ["buyer_id"], name: "index_bids_on_buyer_id"
    t.index ["developer_id"], name: "index_bids_on_developer_id"
    t.index ["job_id"], name: "index_bids_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "price"
    t.string "deadline"
    t.string "contract_type"
    t.boolean "completed", default: false
    t.integer "stars"
    t.bigint "developer_id"
    t.bigint "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_jobs_on_buyer_id"
    t.index ["developer_id"], name: "index_jobs_on_developer_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "tagline"
    t.text "bio"
    t.boolean "developer"
    t.string "portfolio_links"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "userskills", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "developer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_userskills_on_developer_id"
    t.index ["skill_id", "developer_id"], name: "index_userskills_on_skill_id_and_developer_id", unique: true
    t.index ["skill_id"], name: "index_userskills_on_skill_id"
  end

  add_foreign_key "bids", "jobs"
  add_foreign_key "bids", "users", column: "buyer_id"
  add_foreign_key "bids", "users", column: "developer_id"
  add_foreign_key "jobs", "users", column: "buyer_id"
  add_foreign_key "jobs", "users", column: "developer_id"
  add_foreign_key "userskills", "skills"
  add_foreign_key "userskills", "users", column: "developer_id"
end
