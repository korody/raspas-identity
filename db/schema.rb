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

ActiveRecord::Schema.define(version: 20141127175508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "profile_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "authentications", ["profile_id"], name: "index_authentications_on_profile_id", using: :btree

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "slug"
    t.string   "image"
    t.text     "bio"
    t.date     "dob"
    t.date     "dod"
    t.string   "website"
    t.integer  "fans_count",  default: 0
    t.integer  "idols_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["name"], name: "index_authors_on_name", using: :btree
  add_index "authors", ["slug"], name: "index_authors_on_slug", using: :btree
  add_index "authors", ["username"], name: "index_authors_on_username", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "author_id",                            null: false
    t.string   "role",                default: "user", null: false
    t.string   "image"
    t.string   "email",                                null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "reset_token"
    t.datetime "reset_token_sent_at"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "profiles", ["author_id"], name: "index_profiles_on_author_id", using: :btree
  add_index "profiles", ["email"], name: "index_profiles_on_email", using: :btree
  add_index "profiles", ["password_digest"], name: "index_profiles_on_password_digest", using: :btree
  add_index "profiles", ["remember_digest"], name: "index_profiles_on_remember_digest", using: :btree
  add_index "profiles", ["reset_token"], name: "index_profiles_on_reset_token", using: :btree

end
