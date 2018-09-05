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

ActiveRecord::Schema.define(version: 2018_09_04_022730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "bill_images", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "image"
    t.boolean "active"
    t.uuid "house_bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_bill_id"], name: "index_bill_images_on_house_bill_id"
  end

  create_table "bill_payments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.decimal "amount_due"
    t.boolean "paid"
    t.datetime "due_date"
    t.boolean "active"
    t.uuid "house_bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_bill_id"], name: "index_bill_payments_on_house_bill_id"
    t.index ["user_id"], name: "index_bill_payments_on_user_id"
  end

  create_table "chores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.boolean "outdoor"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_bills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "desc"
    t.datetime "due_date"
    t.decimal "amount"
    t.boolean "active"
    t.uuid "user_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "house_id"
    t.index ["house_id"], name: "index_house_bills_on_house_id"
    t.index ["user_id"], name: "index_house_bills_on_user_id"
  end

  create_table "house_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.boolean "is_admin"
    t.boolean "active"
    t.uuid "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_house_users_on_house_id"
    t.index ["user_id"], name: "index_house_users_on_user_id"
  end

  create_table "houses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "house_type"
    t.string "profile_pic"
    t.string "address"
    t.string "state"
    t.string "country"
    t.string "rent_cycle"
    t.datetime "rent_start_date"
    t.string "join_code"
    t.datetime "code_expiry_date"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rent"
  end

  create_table "mate_profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "marital_status"
    t.string "job"
    t.uuid "user_id"
    t.boolean "is_smoker"
    t.string "faith"
    t.string "personality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mate_profiles_on_user_id"
  end

  create_table "mate_reviews", force: :cascade do |t|
    t.decimal "rating"
    t.text "comment"
    t.boolean "active"
    t.uuid "author_id"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_house_chores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "house_id"
    t.uuid "user_id"
    t.uuid "chore_id"
    t.string "day_of_week"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.index ["chore_id"], name: "index_user_house_chores_on_chore_id"
    t.index ["house_id"], name: "index_user_house_chores_on_house_id"
    t.index ["user_id"], name: "index_user_house_chores_on_user_id"
  end

  create_table "user_pets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "size"
    t.boolean "people_friendly"
    t.boolean "child_friendly"
    t.boolean "pet_friendly"
    t.string "profile_pic"
    t.boolean "active"
    t.text "bio"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_pets_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "username"
    t.datetime "dob"
    t.string "profile_pic"
    t.boolean "active"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username", "email"], name: "index_users_on_username_and_email", unique: true
  end

  add_foreign_key "bill_images", "house_bills"
  add_foreign_key "bill_payments", "house_bills"
  add_foreign_key "bill_payments", "users"
  add_foreign_key "house_bills", "houses"
  add_foreign_key "house_bills", "users"
  add_foreign_key "house_users", "houses"
  add_foreign_key "house_users", "users"
  add_foreign_key "mate_profiles", "users"
  add_foreign_key "user_house_chores", "chores"
  add_foreign_key "user_house_chores", "houses"
  add_foreign_key "user_house_chores", "users"
  add_foreign_key "user_pets", "users"
end
