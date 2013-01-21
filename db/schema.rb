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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121125034447) do

  create_table "accounts", :force => true do |t|
    t.string  "name",           :limit => 30
    t.string  "account_number", :limit => 20
    t.decimal "balance",                       :precision => 10, :scale => 2
    t.string  "comments",       :limit => 100
    t.string  "account_type",   :limit => 30
  end

  create_table "budget_items", :force => true do |t|
    t.string  "title",     :limit => 30
    t.decimal "cost_per",                :precision => 8,  :scale => 2
    t.integer "quantity",                :precision => 38, :scale => 0
    t.integer "budget_id",               :precision => 38, :scale => 0
  end

  add_index "budget_items", ["budget_id"], :name => "i_budget_items_budget_id"

  create_table "budgets", :force => true do |t|
    t.integer  "account_id",                     :precision => 38, :scale => 0
    t.string   "name",             :limit => 30
    t.decimal  "limit",                          :precision => 8,  :scale => 2, :default => 0.0
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "allocated_amount",               :precision => 8,  :scale => 2, :default => 0.0
    t.integer  "event_id",                       :precision => 38, :scale => 0
  end

  add_index "budgets", ["account_id"], :name => "index_budgets_on_account_id"
  add_index "budgets", ["event_id"], :name => "index_budgets_on_event_id"

  create_table "donations", :force => true do |t|
    t.integer  "member_id",                   :precision => 38, :scale => 0
    t.decimal  "amount",                      :precision => 8,  :scale => 2
    t.datetime "date_given"
    t.string   "donation_type", :limit => 20
  end

  add_index "donations", ["member_id"], :name => "index_donations_on_member_id"

  create_table "event_members", :force => true do |t|
    t.integer "event_id",  :precision => 38, :scale => 0
    t.integer "member_id", :precision => 38, :scale => 0
  end

  add_index "event_members", ["event_id"], :name => "i_event_members_event_id"
  add_index "event_members", ["member_id"], :name => "i_event_members_member_id"

  create_table "events", :force => true do |t|
    t.string   "name",           :limit => 50
    t.decimal  "estimated_cost",               :precision => 8, :scale => 2
    t.decimal  "actual_cost",                  :precision => 8, :scale => 2
    t.string   "comments"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "expenses", :force => true do |t|
    t.string   "name",           :limit => 30
    t.string   "description"
    t.decimal  "amount",                       :precision => 8,  :scale => 2
    t.integer  "account_id",                   :precision => 38, :scale => 0
    t.datetime "date_of"
    t.string   "payment_method"
    t.integer  "vendor_id",                    :precision => 38, :scale => 0
  end

  add_index "expenses", ["account_id"], :name => "index_expenses_on_account_id"
  add_index "expenses", ["vendor_id"], :name => "index_expenses_on_vendor_id"

  create_table "members", :force => true do |t|
    t.string "first_name",   :limit => 30
    t.string "last_name",    :limit => 30
    t.string "address",      :limit => 100
    t.string "city",         :limit => 20
    t.string "state",        :limit => 2
    t.string "zipcode",      :limit => 10,  :default => "00000-0000"
    t.string "phone_number", :limit => 13,  :default => "000-000-0000"
    t.string "email",        :limit => 35
  end

  create_table "ministries", :force => true do |t|
    t.string   "name",               :limit => 30
    t.string   "meeting_time",       :limit => 20
    t.string   "meeting_day",        :limit => 100
    t.decimal  "dues_collected",                    :precision => 10, :scale => 2
    t.decimal  "balance_avaialable",                :precision => 10, :scale => 2
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

  create_table "minstry_members", :force => true do |t|
    t.integer  "ministry_id",               :precision => 38, :scale => 0
    t.integer  "member_id",                 :precision => 38, :scale => 0
    t.string   "position",    :limit => 35
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "minstry_members", ["member_id"], :name => "i_minstry_members_member_id"
  add_index "minstry_members", ["ministry_id"], :name => "i_minstry_members_ministry_id"

  create_table "vendors", :force => true do |t|
    t.string "name",         :limit => 75
    t.string "address",      :limit => 100
    t.string "city",         :limit => 25
    t.string "state",        :limit => 2
    t.string "zipcode",      :limit => 10
    t.string "phone_number", :limit => 13
    t.string "email",        :limit => 35
  end

end
