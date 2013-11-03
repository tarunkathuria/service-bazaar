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

ActiveRecord::Schema.define(version: 20131103151359) do

  create_table "Appointment", id: false, force: true do |t|
    t.string  "buyerName",   limit: 30, default: "", null: false
    t.integer "listingID",              default: 0,  null: false
    t.integer "serviceID",              default: 0,  null: false
    t.float   "price"
    t.boolean "isConfirmed"
  end

  create_table "Buyer", primary_key: "username", force: true do |t|
    t.string "password",          limit: 20
    t.float  "latitudeLocation"
    t.float  "longitudeLocation"
    t.string "realName",          limit: 60
    t.date   "dateOfBirth"
    t.string "emailID",           limit: 40
  end

  create_table "BuyerVendor", primary_key: "username", force: true do |t|
    t.string "password",          limit: 20
    t.float  "latitudeLocation"
    t.float  "longitudeLocation"
    t.string "realName",          limit: 60
    t.date   "dateOfBirth"
    t.string "emailID",           limit: 40
    t.float  "rating"
  end

  create_table "Category", primary_key: "categoryID", force: true do |t|
    t.string "Name",        limit: 40
    t.string "Description", limit: 500
  end

  create_table "Exchange", id: false, force: true do |t|
    t.string  "senderName",   limit: 30, default: "", null: false
    t.string  "receiverName", limit: 30, default: "", null: false
    t.integer "messageID",               default: 0,  null: false
  end

  create_table "Feedback", primary_key: "feedbackID", force: true do |t|
    t.float  "rating"
    t.string "review", limit: 4000
  end

  create_table "FeedbackFor", id: false, force: true do |t|
    t.integer "feedbackID"
    t.string  "buyerName",  limit: 30, default: "", null: false
    t.integer "serviceID",             default: 0,  null: false
  end

  create_table "LiesIn", id: false, force: true do |t|
    t.integer "categoryID", default: 0, null: false
    t.integer "serviceID",  default: 0, null: false
  end

  create_table "Listing", id: false, force: true do |t|
    t.integer "serviceID",                        default: 0, null: false
    t.integer "listingID",                        default: 0, null: false
    t.float   "minPrice"
    t.float   "maxPrice"
    t.time    "startingTime"
    t.time    "endingTime"
    t.date    "startDate"
    t.date    "endDate"
    t.float   "latitudeLocation"
    t.float   "longitudeLocation"
    t.string  "listingDescription",   limit: 100
    t.string  "availability",         limit: 20
    t.float   "availabilityDistance"
  end

  create_table "Message", primary_key: "messageID", force: true do |t|
    t.date   "messageDate"
    t.string "subject",     limit: 100
    t.string "messageText", limit: 2000
  end

  create_table "OfferedService", primary_key: "serviceID", force: true do |t|
  end

  create_table "Offers", id: false, force: true do |t|
    t.string  "vendorName", limit: 30, default: "", null: false
    t.integer "serviceID",             default: 0,  null: false
  end

  create_table "RequestedService", primary_key: "serviceID", force: true do |t|
  end

  create_table "Requests", id: false, force: true do |t|
    t.string  "buyerName", limit: 30, default: "", null: false
    t.integer "serviceID",            default: 0,  null: false
  end

  create_table "Service", primary_key: "serviceID", force: true do |t|
    t.string  "title",       limit: 100
    t.string  "description", limit: 500
    t.integer "visibility"
  end

  create_table "Vendor", primary_key: "username", force: true do |t|
    t.string "password",          limit: 20
    t.float  "latitudeLocation"
    t.float  "longitudeLocation"
    t.string "realName",          limit: 60
    t.date   "dateOfBirth"
    t.string "emailID",           limit: 40
    t.float  "rating"
  end

  create_table "users", id: false, force: true do |t|
    t.string   "username",    null: false
    t.float    "latitude",    null: false
    t.float    "longitude",   null: false
    t.string   "realName"
    t.date     "dateOfBirth"
    t.string   "emailID",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

  add_index "users", ["emailID"], name: "index_Users_on_emailID", unique: true, using: :btree
  add_index "users", ["username"], name: "index_Users_on_username", unique: true, using: :btree

end
