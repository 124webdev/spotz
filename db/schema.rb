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

ActiveRecord::Schema[7.1].define(version: 2024_05_28_100106) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_bookmarks_on_spot_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.date "date"
    t.time "time"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "links", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_links_on_experience_id"
    t.index ["spot_id"], name: "index_links_on_spot_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "rating"
    t.text "content"
    t.string "reviewable_type", null: false
    t.bigint "reviewable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "category"
    t.string "subtitle"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_visits_on_spot_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "bookmarks", "spots"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "links", "experiences"
  add_foreign_key "links", "spots"
  add_foreign_key "reviews", "users"
  add_foreign_key "visits", "spots"
  add_foreign_key "visits", "users"
end