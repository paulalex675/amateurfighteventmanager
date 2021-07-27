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

ActiveRecord::Schema.define(version: 2021_07_19_200311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address1", default: "", null: false
    t.string "address2", default: "", null: false
    t.string "town_or_city", default: "", null: false
    t.string "county", default: "", null: false
    t.string "post_code", default: "", null: false
    t.string "country", default: "", null: false
    t.integer "hostable_id", default: 0, null: false
    t.string "hostable_type", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.integer "number_of_guests"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "body", default: "", null: false
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "gym_id"
    t.datetime "event_date", null: false
    t.string "event_name", default: "", null: false
    t.text "event_info", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "ticket_price", default: 0.0
    t.integer "num_tickets", default: 0, null: false
  end

  create_table "fight_profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ring_name", default: "", null: false
    t.integer "style_id"
    t.integer "gym_id", null: false
    t.string "gender", default: "", null: false
    t.string "fight_weight", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fight_records", force: :cascade do |t|
    t.integer "user_id"
    t.integer "style_id"
    t.integer "win", default: 0, null: false
    t.integer "draw", default: 0, null: false
    t.integer "lose", default: 0, null: false
    t.integer "fight_score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fights", force: :cascade do |t|
    t.integer "fighter_a_id", null: false
    t.integer "fighter_b_id", null: false
    t.string "style_id", default: "", null: false
    t.string "weight", default: "", null: false
    t.string "result", default: "", null: false
    t.boolean "draw", default: false, null: false
    t.integer "winner_id", default: 0, null: false
    t.text "info", default: "", null: false
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "requestor_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_friend_requests_on_receiver_id"
    t.index ["requestor_id"], name: "index_friend_requests_on_requestor_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_a_id"
    t.integer "user_b_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_a_id"], name: "index_friendships_on_user_a_id"
    t.index ["user_b_id"], name: "index_friendships_on_user_b_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", default: "", null: false
    t.integer "style_id"
    t.string "email", default: "", null: false
    t.string "website", default: "", null: false
    t.string "telephone", default: "", null: false
    t.integer "num_prems", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "liker_id"
    t.integer "likeable_id"
    t.string "likeable_type", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "notifiable_id"
    t.string "notifiable_type", default: "", null: false
    t.integer "recipient_id"
    t.string "action"
    t.datetime "read_at"
    t.integer "actor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "body", default: "", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sign_ups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_sign_ups_on_event_id"
    t.index ["user_id"], name: "index_sign_ups_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "event_id"
    t.float "price"
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "username", default: "", null: false
    t.string "last_name", default: "", null: false
    t.text "bio", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 200, default: "", null: false
    t.string "provider_picture", default: "", null: false
    t.boolean "admin?", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
