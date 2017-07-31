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

ActiveRecord::Schema.define(version: 20170711050052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "country"
    t.string   "mobile"
  end

  create_table "admin_mob_emails", force: :cascade do |t|
    t.string   "admin_email"
    t.string   "admin_mobile_no"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "code"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "name"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "book_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "projects_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["project_id"], name: "index_comments_on_project_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contests", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name"
    t.text     "terms_of_service"
    t.string   "location"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "slug"
    t.boolean  "main",             default: false, null: false
  end

  create_table "group_invitations", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "email"
    t.boolean  "accepted",   default: false, null: false
    t.string   "code"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "group_invitations", ["group_id"], name: "index_group_invitations_on_group_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "image_id"
    t.string   "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["project_id"], name: "index_groups_on_project_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "image_id"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_filename"
    t.integer  "image_size"
    t.string   "image_content_type"
  end

  add_index "images", ["project_id"], name: "index_images_on_project_id", using: :btree

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.boolean  "digital"
    t.integer  "product_price_id"
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["product_price_id"], name: "index_order_products_on_product_price_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "shipped"
    t.decimal  "price"
    t.boolean  "complete",            default: false
    t.decimal  "tax"
    t.decimal  "subtotal"
    t.decimal  "shipping"
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "shipping_address_id"
    t.integer  "billing_address_id"
    t.string   "token"
    t.string   "email"
    t.integer  "order_otp"
    t.integer  "user_id"
    t.boolean  "deletion_status"
    t.string   "tracking_number"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "transaction_id"
    t.string   "location_id"
    t.integer  "amount"
    t.string   "card_brand"
    t.string   "card_last_4"
    t.integer  "order_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "subscription_id"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.integer  "user_id"
    t.string   "tender_id"
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id", using: :btree
  add_index "payments", ["subscription_id"], name: "index_payments_on_subscription_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "product_prices", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "book_type"
  end

  add_index "product_prices", ["product_id"], name: "index_product_prices_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image_id"
    t.string   "image_filename"
    t.integer  "image_size"
    t.string   "image_content_type"
    t.string   "book_download_id"
    t.string   "book_download_filename"
    t.string   "book_download_content_type"
    t.integer  "book_types_id"
    t.integer  "book_versions_id"
  end

  add_index "products", ["book_types_id"], name: "index_products_on_book_types_id", using: :btree
  add_index "products", ["book_versions_id"], name: "index_products_on_book_versions_id", using: :btree

  create_table "project_categories", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "project_categories", ["category_id"], name: "index_project_categories_on_category_id", using: :btree
  add_index "project_categories", ["project_id"], name: "index_project_categories_on_project_id", using: :btree

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "project_users", ["project_id"], name: "index_project_users_on_project_id", using: :btree
  add_index "project_users", ["user_id"], name: "index_project_users_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "contest_id"
    t.integer  "votes_count",        default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "video_id"
    t.string   "video_mp4_id"
    t.string   "video_webm_id"
    t.string   "tagline"
    t.integer  "step",               default: 1
    t.boolean  "finalized",          default: false, null: false
    t.string   "video_filename"
    t.integer  "video_size"
    t.string   "video_content_type"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.boolean  "deletion_status"
  end

  add_index "projects", ["contest_id"], name: "index_projects_on_contest_id", using: :btree

  create_table "redemption_codes", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  create_table "refunds", force: :cascade do |t|
    t.string   "refund_id"
    t.string   "transaction_id"
    t.string   "location_id"
    t.string   "tender_id"
    t.integer  "amount"
    t.integer  "payment_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "order_id"
    t.integer  "subscription_id"
  end

  add_index "refunds", ["order_id"], name: "index_refunds_on_order_id", using: :btree
  add_index "refunds", ["payment_id"], name: "index_refunds_on_payment_id", using: :btree
  add_index "refunds", ["subscription_id"], name: "index_refunds_on_subscription_id", using: :btree

  create_table "send_requests", force: :cascade do |t|
    t.string   "message"
    t.string   "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "send_requests", ["user_id"], name: "index_send_requests_on_user_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "duration"
    t.date     "start_date"
    t.string   "region"
    t.text     "notes"
    t.text     "admin_notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.integer  "amount"
    t.string   "interval"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.boolean  "active"
    t.string   "customer_id"
    t.string   "card_id"
    t.string   "card_brand"
    t.string   "card_last_4"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "subscription_plan_id"
    t.string   "email"
    t.integer  "subscription_otp"
    t.string   "sub_mobile_no"
    t.integer  "card_cvv"
    t.boolean  "renewal_status"
  end

  add_index "subscriptions", ["subscription_plan_id"], name: "index_subscriptions_on_subscription_plan_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "redemption_code"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "device_token"
    t.string   "device_platform"
    t.string   "authentication_token"
    t.datetime "token_expires_at"
    t.string   "image_id"
    t.string   "website"
    t.string   "bio"
    t.string   "location"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.boolean  "is_permanent"
    t.string   "phone_no"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "weight",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "votes", ["project_id"], name: "index_votes_on_project_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users"
  add_foreign_key "group_invitations", "groups"
  add_foreign_key "groups", "projects"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "product_prices"
  add_foreign_key "payments", "orders"
  add_foreign_key "payments", "subscriptions"
  add_foreign_key "payments", "users"
  add_foreign_key "project_categories", "categories"
  add_foreign_key "project_categories", "projects"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "projects", "contests"
  add_foreign_key "refunds", "orders"
  add_foreign_key "refunds", "payments"
  add_foreign_key "refunds", "subscriptions"
  add_foreign_key "subscriptions", "subscription_plans"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "votes", "projects"
  add_foreign_key "votes", "users"
end
