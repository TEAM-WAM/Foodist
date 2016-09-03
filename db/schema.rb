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

ActiveRecord::Schema.define(version: 20160902193732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body",             null: false
    t.integer  "user_id",          null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string   "field_name",            limit: 100, null: false
    t.string   "customable_field_type",             null: false
    t.integer  "customable_field_id",               null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "custom_values", force: :cascade do |t|
    t.string   "field_value",           limit: 100, null: false
    t.integer  "custom_field_id",                   null: false
    t.string   "customable_value_type",             null: false
    t.integer  "customable_value_id",               null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 50, null: false
    t.text     "description",            null: false
    t.integer  "creator_id",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id",  null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", using: :btree
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id", using: :btree
  end

  create_table "list_experiences", force: :cascade do |t|
    t.date     "date_of_experience",             null: false
    t.string   "main_dish",          limit: 100
    t.integer  "price"
    t.integer  "party_size"
    t.integer  "time_seated"
    t.integer  "time_waiting"
    t.text     "notes"
    t.integer  "list_restaurant_id",             null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "list_restaurants", force: :cascade do |t|
    t.string   "name",            limit: 100, null: false
    t.string   "cuisine",         limit: 100
    t.string   "fav_dish",        limit: 100
    t.string   "restaurant_type", limit: 100
    t.string   "location",        limit: 100
    t.boolean  "tried"
    t.integer  "restaurant_id",               null: false
    t.integer  "list_id",                     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title",         limit: 100, null: false
    t.string   "listable_type",             null: false
    t.integer  "listable_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "bio"
    t.string   "zipcode",      limit: 10
    t.date     "birthday"
    t.string   "phone_number", limit: 16
    t.string   "gender",       limit: 50
    t.string   "image",                   default: "assets/images/profile_apple.jpg"
    t.integer  "user_id",                                                             null: false
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                 limit: 100, null: false
    t.string   "restaurant_url"
    t.string   "address",              limit: 200, null: false
    t.string   "locality",             limit: 100
    t.string   "city",                 limit: 100, null: false
    t.string   "zipcode",              limit: 10
    t.string   "average_cost_for_two", limit: 10
    t.string   "featured_img"
    t.string   "menu_url"
    t.boolean  "has_online_delivery"
    t.string   "cuisines"
    t.string   "restaurant_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 100,              null: false
    t.string   "first_name",             limit: 100,              null: false
    t.string   "last_name",              limit: 100,              null: false
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "up"
    t.string   "voteable_type", null: false
    t.integer  "voteable_id",   null: false
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
