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

ActiveRecord::Schema.define(version: 3) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitation_images", force: true do |t|
    t.integer  "invitation_id", null: false
    t.string   "image",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitation_images", ["invitation_id"], name: "index_invitation_images_on_invitation_id", using: :btree

  create_table "invitations", force: true do |t|
    t.integer  "user_id",         null: false
    t.integer  "booking_user_id"
    t.integer  "price",           null: false
    t.string   "address",         null: false
    t.text     "describe"
    t.string   "email",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["booking_user_id"], name: "index_invitations_on_booking_user_id", using: :btree
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
    t.string   "facebook_url"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "invitation_images", "invitations", name: "invitation_images_invitation_id_fk", dependent: :delete

  add_foreign_key "invitations", "users", name: "invitations_booking_user_id_fk", column: "booking_user_id", dependent: :delete
  add_foreign_key "invitations", "users", name: "invitations_user_id_fk", dependent: :delete

end
