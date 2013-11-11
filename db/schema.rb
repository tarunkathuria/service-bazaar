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

ActiveRecord::Schema.define(version: 20131111183600) do

  create_table "buyers", primary_key: "username", force: true do |t|
    t.string "password",          limit: 20
    t.float  "latitudeLocation"
    t.float  "longitudeLocation"
    t.string "realName",          limit: 60
    t.date   "dateOfBirth"
    t.string "emailID",           limit: 40
  end

  create_table "buyervendors", primary_key: "username", force: true do |t|
    t.string "password",          limit: 20
    t.float  "latitudeLocation"
    t.float  "longitudeLocation"
    t.string "realName",          limit: 60
    t.date   "dateOfBirth"
    t.string "emailID",           limit: 40
    t.float  "rating"
  end

  create_table "categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchanges", id: false, force: true do |t|
    t.string  "senderName",   limit: 30, default: "", null: false
    t.string  "receiverName", limit: 30, default: "", null: false
    t.integer "messageID",               default: 0,  null: false
  end

  create_table "feedbackfors", id: false, force: true do |t|
    t.integer "feedbackID"
    t.string  "buyerName",  limit: 30, default: "", null: false
    t.integer "serviceID",             default: 0,  null: false
  end

  create_table "liesins", id: false, force: true do |t|
    t.integer "categoryID", default: 0, null: false
    t.integer "serviceID",  default: 0, null: false
  end

  create_table "mailboxer_conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree

  create_table "mailboxer_receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree

  create_table "messages", force: true do |t|
  end

  create_table "offers", id: false, force: true do |t|
    t.string  "vendorName", limit: 30, default: "", null: false
    t.integer "serviceID",             default: 0,  null: false
  end

  create_table "services", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.integer  "visibility"
  end

  create_table "users", id: false, force: true do |t|
    t.string   "username",       null: false
    t.float    "latitude",       null: false
    t.float    "longitude",      null: false
    t.string   "realName"
    t.date     "dateOfBirth"
    t.string   "emailID",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "remember_token"
  end

  add_index "users", ["emailID"], name: "index_users_on_emailID", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vendors", primary_key: "username", force: true do |t|
    t.string "password",          limit: 20
    t.float  "latitudeLocation"
    t.float  "longitudeLocation"
    t.string "realName",          limit: 60
    t.date   "dateOfBirth"
    t.string "emailID",           limit: 40
    t.float  "rating"
  end

  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", name: "notifications_on_conversation_id", column: "conversation_id"

  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", name: "receipts_on_notification_id", column: "notification_id"

end
