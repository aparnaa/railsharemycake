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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120603145013) do

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.text     "wishes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "contact_name"
    t.string   "email"
    t.string   "phone_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "myevent_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender"
    t.text     "message"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "member_id"
    t.integer  "myevent_id"
    t.integer  "transaction_id"
    t.integer  "org_amt"
    t.integer  "member_amt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "email",                                 :default => "",     :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "role",                                  :default => "user"
    t.integer  "mobile"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
  end

  add_index "members", ["confirmation_token"], :name => "index_members_on_confirmation_token", :unique => true
  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "myevents", :force => true do |t|
    t.string   "mobile_number"
    t.string   "title"
    t.date     "date"
    t.time     "time"
    t.string   "venue"
    t.text     "description"
    t.string   "cause"
    t.string   "organisation_name"
    t.float    "share_amount"
    t.integer  "message_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id"
    t.text     "message"
  end

  create_table "organisations", :force => true do |t|
    t.string   "organisation_name"
    t.string   "contact_person"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.text     "description"
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.text     "wishes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "amount"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.integer  "card_number",       :limit => 8
    t.integer  "card_verification"
    t.date     "card_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.integer  "myevent_id"
  end

end
